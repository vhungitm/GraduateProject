using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class ProjectTypeDAO
    {
        DBContext db;
        public ProjectTypeDAO()
        {
            db = new DBContext();
        }

        public List<ProjectType> getProjectTypes(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<ProjectType>("uspGetProjectTypes @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(ProjectType model)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Name", model.Name);

                return db.Database.ExecuteSqlCommand("uspInsertProjectType @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(ProjectType model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[] {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateProjectType @Id, @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteProjectType @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Class GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Class>("uspGetProjectType @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

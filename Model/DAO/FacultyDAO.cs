using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class FacultyDAO
    {
        DBContext db;
        public FacultyDAO()
        {
            db = new DBContext();
        }

        public List<Faculty> getFaculties(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Faculty>("uspGetFaculties @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Faculty model)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Name", model.Name);

                return db.Database.ExecuteSqlCommand("uspInsertFaculty @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Faculty model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[] {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateFaculty @Id, @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteFaculty @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Class GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Class>("uspGetFaculty @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

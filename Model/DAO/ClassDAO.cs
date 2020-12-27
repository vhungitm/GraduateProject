using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class ClassDAO
    {
        DBContext db;
        public ClassDAO()
        {
            db = new DBContext();
        }

        public List<Class> GetClasses(string search, string faculty, string branch, string trainingSystem, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Faculty", faculty),
                    new SqlParameter("@Branch", branch),
                    new SqlParameter("@TrainingSystem", trainingSystem),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Class>("uspGetClasses @Search, @Faculty, @Branch, @TrainingSystem, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Class model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@BranchId", model.BranchId),
                    new SqlParameter("@Size", model.Size),
                    new SqlParameter("@TranningSystemId", model.TrainingSystemId),
                    new SqlParameter("@CollegeYear", model.CollegeYear),
                };

                return db.Database.ExecuteSqlCommand("uspInsertClass @Name, @BranchId, @Size, @TranningSystemId, @CollegeYear", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Class model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@BranchId", model.BranchId),
                    new SqlParameter("@Size", model.Size),
                    new SqlParameter("@TrainingSystemId", model.TrainingSystemId),
                    new SqlParameter("@CollegeYear", model.CollegeYear),
                };

                return db.Database.ExecuteSqlCommand("uspUpdateClass @Id, @Name, @BranchId, @Size, @TrainingSystemId, @CollegeYear", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteClass @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Class GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Class>("uspGetClass @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

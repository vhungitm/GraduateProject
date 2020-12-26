using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class BranchDAO
    {
        DBContext db;
        public BranchDAO()
        {
            db = new DBContext();
        }

        public List<Branch> getBranches(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Branch>("uspGetBranches @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Branch model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[] { 
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@FacultyId", model.FacultyId)
                };

                return db.Database.ExecuteSqlCommand("uspInsertBranch @Name, @FacultyId", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Branch model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[] {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@FacultyId", model.FacultyId)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateBranch @Id, @Name, @FacultyId", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteBranch @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Class GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Class>("uspGetBranch @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

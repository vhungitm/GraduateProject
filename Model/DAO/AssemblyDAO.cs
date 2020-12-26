using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class AssemblyDAO
    {
        DBContext db;
        public AssemblyDAO()
        {
            db = new DBContext();
        }

        public List<Assembly> GetAssemplies(string search, int status, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Status", status),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Assembly>("uspGetAssemblies @Search, @Status, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Assembly model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@CreatedDate", model.CreatedDate),
                    new SqlParameter("@Status", model.Status)
                };

                return db.Database.ExecuteSqlCommand("uspInsertAssembly @Name, @CreatedDate, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Assembly model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@CreatedDate", model.CreatedDate),
                    new SqlParameter("@Status", model.Status)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateAssembly @Id, @Name, @CreatedDate, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteAssembly @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Assembly GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Assembly>("uspGetAssembly @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }

        public int ChangeStatus(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<int>("uspChangeAssemblyStatus @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return -1; }
        }
    }
}

using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class TranningSystemDAO
    {
        DBContext db;
        public TranningSystemDAO()
        {
            db = new DBContext();
        }

        public List<TranningSystem> GetTranningSystems(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<TranningSystem>("uspGetTranningSystems @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(TranningSystem model)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Name", model.Name);

                return db.Database.ExecuteSqlCommand("uspInsertTranningSytem @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(TranningSystem model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[] {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateTranningSystem @Id, @Name", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteTranningSystem @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Class GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Class>("uspGetTranningSystem @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

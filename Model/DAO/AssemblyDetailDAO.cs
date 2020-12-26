using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class AssemblyDetailDAO
    {
        DBContext db;
        public AssemblyDetailDAO()
        {
            db = new DBContext();
        }

        public List<AssemblyDetail> GetAssemplyDetails(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<AssemblyDetail>("uspGetAssemblyDetails @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(AssemblyDetail model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@AssemblyId", model.AssemblyId),
                    new SqlParameter("@LecturerId", model.LecturerId),
                    new SqlParameter("@Comment", model.Comment),
                    new SqlParameter("@Point", model.Point)
                };

                return db.Database.ExecuteSqlCommand("uspInsertAssemblyDetail @AssemblyId, @LecturerId, @Comment, @Point", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(AssemblyDetail model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@AssemblyId", model.AssemblyId),
                    new SqlParameter("@LecturerId", model.LecturerId),
                    new SqlParameter("@Comment", model.Comment),
                    new SqlParameter("@Point", model.Point)
                };

                return db.Database.ExecuteSqlCommand("uspUpdateAssemblyDetail @AssemblyId, @LecturerId, @Comment, @Point", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long assemblyId, long lecturerId)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]{
                    new SqlParameter("@AssemblyId", assemblyId),
                    new SqlParameter("@LecturerId", lecturerId)
                };

                return db.Database.ExecuteSqlCommand("uspDeleteAssemblyDetail @AssemblyId, @LecturerId", sp);
            }
            catch (Exception) { return 0; }
        }

        public Assembly GetDetail(long assemblyId, long lecturerId)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]{
                    new SqlParameter("@AssemblyId", assemblyId),
                    new SqlParameter("@LecturerId", lecturerId)
                };

                return db.Database.SqlQuery<Assembly>("uspGetAssemblyDetail @AssemblyId, @LecturerId", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

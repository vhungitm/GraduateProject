using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ClassDAO
    {
        DBContext db;

        public ClassDAO()
        {
            db = new DBContext();
        }

        public List<Class> Get(string id, string facultyId, string branchId, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[] {
                new SqlParameter("@Id", id),
                new SqlParameter("@FacultyId", facultyId),
                new SqlParameter("@BranchId", branchId),
                new SqlParameter("@Page", page),
                new SqlParameter("@PageSize", pageSize)
            };

                return db.Database.SqlQuery<Class>("uspGetClasses @Id, @FacultyId, @BranchId, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception)
            {
                return new List<Class>();
            }
        }
    }
}

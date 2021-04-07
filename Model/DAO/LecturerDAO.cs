using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class LecturerDAO
    {
        DBContext db;
        public LecturerDAO()
        {
            db = new DBContext();
        }

        public int Login(string username, string password, int groupId)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@Username", username),
                new SqlParameter("@Password", password),
                new SqlParameter("@GroupId", groupId),
            };

            return db.Database.SqlQuery<int>("uspLogin @Username, @Password, @GroupId", sqlParameters).SingleOrDefault();
        }

        public List<Lecturer> Get(string id, string fullName, string facultyId, string branchId, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[] {
                new SqlParameter("@Id", id),
                new SqlParameter("@FullName", fullName),
                new SqlParameter("@FacultyId", facultyId),
                new SqlParameter("@BranchId", branchId),
                new SqlParameter("@Page", page),
                new SqlParameter("@PageSize", pageSize)
            };

                return db.Database.SqlQuery<Lecturer>("uspGetLecturers @Id, @FullName, @FacultyId, @BranchId, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception)
            {
                return new List<Lecturer>();
            }
        }
    }
}

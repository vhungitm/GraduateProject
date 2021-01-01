using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model.EF;

namespace Model.DAO
{
    public class StudentDAO
    {
        DBContext db;
        public StudentDAO()
        {
            db = new DBContext();
        }

        public List<Student> GetStudents(string fullName, string username, long facultyId, long branchId, long classId, long trainingSystemId, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@Username", username),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@TrainingSystemId", trainingSystemId),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Student>("uspGetStudents @FullName, @Username, @FacultyId, @BranchId, @ClassId, @TrainingSystemId, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception) { return null; }
        }

        public Student GetStudent(string fullName, string username, long facultyId, long branchId, long classId, long trainingSystemId, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@Username", username),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@TrainingSystemId", trainingSystemId),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Student>("uspGetStudents @FullName, @Username, @FacultyId, @BranchId, @ClassId, @TrainingSystemId, @Page, @PageSize", sqlParameters).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

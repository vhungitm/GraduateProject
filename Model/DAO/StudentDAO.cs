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

        public List<Student> CountStudent(string Id, string fullName, string facultyId, string branchId, string classId, string trainingSystemId)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", Id),
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@TrainingSystemId", trainingSystemId)
                };

                return db.Database.SqlQuery<Student>("uspGetStudents @Id, @FullName, @FacultyId, @BranchId, @ClassId, @TrainingSystemId", sqlParameters).ToList();
            }
            catch (Exception) { return null; }
        }

        public List<Student> GetStudents(string Id, string fullName, string facultyId, string branchId, string classId, string trainingSystemId, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", Id),
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@TrainingSystemId", trainingSystemId),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Student>("uspGetStudents @Id, @FullName, @FacultyId, @BranchId, @ClassId, @TrainingSystemId, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception) { return null; }
        }

        public Student GetStudent(string id)
        {
            try
            {
                SqlParameter sqlParameter = new SqlParameter("@Id", id);

                return db.Database.SqlQuery<Student>("uspGetStudent @Id", sqlParameter).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

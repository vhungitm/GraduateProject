using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using Model.EF;

namespace Model.DAO
{
    public class ProjectDAO
    {
        DBContext db;
        public ProjectDAO()
        {
            db = new DBContext();
        }

        public List<Project> Get(long id, string name, string student, string lecturer, long projectTypeId, int year, string facultyId, string branchId, string classId, int pointStatus, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", id),
                    new SqlParameter("@Name", name),
                    new SqlParameter("@Student", student),
                    new SqlParameter("@Lecturer", lecturer),
                    new SqlParameter("@ProjectTypeId", projectTypeId),
                    new SqlParameter("@Year", year),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@PointStatus", pointStatus),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize),
                };

                return db.Database.SqlQuery<Project>("uspGetProjects @Id, @Name, @Student, @Lecturer, @ProjectTypeId, @Year, @FacultyId, @BranchId, @ClassId, @PointStatus, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception)
            {
                return new List<Project>();
            }
        }

        public int Count(long id, string name, string student, string lecturer, long projectTypeId, int year, string facultyId, string branchId, string classId, int pointStatus)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", id),
                    new SqlParameter("@Name", name),
                    new SqlParameter("@Student", student),
                    new SqlParameter("@Lecturer", lecturer),
                    new SqlParameter("@ProjectTypeId", projectTypeId),
                    new SqlParameter("@Year", year),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId),
                    new SqlParameter("@PointStatus", pointStatus)
                };

                return db.Database.SqlQuery<int>("uspCountProject @Id, @Name, @Student, @Lecturer, @ProjectTypeId, @Year, @FacultyId, @BranchId, @ClassId, @PointStatus", sqlParameters).SingleOrDefault();
            }
            catch (Exception)
            {
                return -1;
            }
        }

        public int Insert(Project entity)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Name", entity.Name),
                    new SqlParameter("@TypeId", entity.TypeId),
                    new SqlParameter("@StudentId", entity.StudentId),
                    new SqlParameter("@LecturerId", entity.LecturerId),
                    new SqlParameter("@StartDate", entity.StartDate),
                    new SqlParameter("@EndDate", entity.EndDate)
                };

                return db.Database.SqlQuery<int>("uspInsertProject @Name, @TypeId, @StudentId, @LecturerId, @StartDate, @EndDate", sqlParameters).SingleOrDefault();
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update(Project entity)
        {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", entity.Id),
                    new SqlParameter("@Name", entity.Name == null ? "" : entity.Name),
                    new SqlParameter("@TypeId", entity.TypeId == null ? (long) 0 : entity.TypeId),
                    new SqlParameter("@StudentId", entity.StudentId == null ? "" : entity.StudentId),
                    new SqlParameter("@StartDate", entity.StartDate == null ? "" : entity.StartDate),
                    new SqlParameter("@EndDate", entity.EndDate == null ? "" : entity.EndDate),
                    new SqlParameter("@Submission", entity.Submission == null ? "" : entity.Submission),
                    new SqlParameter("@Point", entity.Point == null ? 0 : entity.Point)
                };

                return db.Database.SqlQuery<int>("uspUpdateProject @Id, @Name, @TypeId, @StudentId, @StartDate, @EndDate, @Submission, @Point", sqlParameters).SingleOrDefault();
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sqlParameter = new SqlParameter("@Id", id);

                return db.Database.ExecuteSqlCommand("uspDeleteProject @Id", sqlParameter);
            }
            catch (Exception) { return 0; }
        }
    }
}

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

        public Project GetProject(long id, string name, string student, string lecturer, long projectTypeId, int year, long facultyId, long branchId, long classId, int page, int pageSize)
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
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize),
                };

                return db.Database.SqlQuery<Project>("uspGetProjects @Id, @Name, @Student, @Lecturer, @ProjectTypeId, @Year, @FacultyId, @BranchId, @ClassId, @Page, @PageSize", sqlParameters).SingleOrDefault();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Project> GetProjects(string name, string student, string lecturer, long projectTypeId, int year, long facultyId, long branchId, long classId, int page, int pageSize)
        {
            try
            {
                long id = 0;
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
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize),
                };

                return db.Database.SqlQuery<Project>("uspGetProjects @Id, @Name, @Student, @Lecturer, @ProjectTypeId, @Year, @FacultyId, @BranchId, @ClassId, @Page, @PageSize", sqlParameters).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public int CountProject(string name, string student, string lecturer, long projectTypeId, int year, long facultyId, long branchId, long classId)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Name", name),
                    new SqlParameter("@Student", student),
                    new SqlParameter("@Lecturer", lecturer),
                    new SqlParameter("@ProjectTypeId", projectTypeId),
                    new SqlParameter("@Year", year),
                    new SqlParameter("@FacultyId", facultyId),
                    new SqlParameter("@BranchId", branchId),
                    new SqlParameter("@ClassId", classId)
                };

                return db.Database.SqlQuery<int>("uspCountProject @Name, @Student, @Lecturer, @ProjectTypeId, @Year, @FacultyId, @BranchId, @ClassId", sqlParameters).SingleOrDefault();
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

                return db.Database.ExecuteSqlCommand("uspInsertProject @Name, @TypeId, @StudentId, @LecturerId, @StartDate, @EndDate", sqlParameters);
            }
            catch (Exception)
            {
                return 0;
            }
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

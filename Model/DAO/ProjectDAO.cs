using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class ProjectDAO
    {
        DBContext db;
        public ProjectDAO()
        {
            db = new DBContext();
        }

        public List<Project> GetStudents(string search, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Project>("uspGetProjects @Search, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Project model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@TypeId", model.TypeId),
                    new SqlParameter("@StudentId", model.StudentId),
                    new SqlParameter("@LecturerId", model.LecturerId),
                    new SqlParameter("@SubmissionDate", model.SubmissionDate),
                    new SqlParameter("@Submission", model.Submission),
                    new SqlParameter("@Point", model.Point)
                };

                return db.Database.ExecuteSqlCommand("uspInsertProject @Name, @TypeId, @StudentId, @LecturerId, @SubmissionDate, @Submission, @Point", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Project model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@TypeId", model.TypeId),
                    new SqlParameter("@StudentId", model.StudentId),
                    new SqlParameter("@LecturerId", model.LecturerId),
                    new SqlParameter("@SubmissionDate", model.SubmissionDate),
                    new SqlParameter("@Submission", model.Submission),
                    new SqlParameter("@Point", model.Point)
                };

                return db.Database.ExecuteSqlCommand("uspInsertProject @Id, @Name, @TypeId, @StudentId, @LecturerId, @SubmissionDate, @Submission, @Point", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteProject @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Student GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Student>("uspGetProject @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }
    }
}

using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class ProjectStageDAO
    {
        DBContext db;
        public ProjectStageDAO()
        {
            db = new DBContext();
        }

        public List<ProjectStage> GetProjectStages(string search, int status, int page, int pageSize)
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

                return db.Database.SqlQuery<ProjectStage>("uspGetProjectStages @Search, @Status, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(ProjectStage model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@ProjectId", model.ProjectId),
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@TypeId", model.Description),
                    new SqlParameter("@StudentId", model.CreatedDate),
                    new SqlParameter("@LecturerId", model.EndDate),
                    new SqlParameter("@SubmissionDate", model.SubmissionDate),
                    new SqlParameter("@Submission", model.Submission),
                    new SqlParameter("@Comment", model.Comment),
                    new SqlParameter("@Status", model.Status)
                };

                return db.Database.ExecuteSqlCommand("uspInsertProject @ProjectId, @Name, @Description, @CreatedDate, @SubmissionDate, @Submission, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(ProjectStage model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@ProjectId", model.ProjectId),
                    new SqlParameter("@Name", model.Name),
                    new SqlParameter("@TypeId", model.Description),
                    new SqlParameter("@StudentId", model.CreatedDate),
                    new SqlParameter("@LecturerId", model.EndDate),
                    new SqlParameter("@SubmissionDate", model.SubmissionDate),
                    new SqlParameter("@Submission", model.Submission),
                    new SqlParameter("@Comment", model.Comment),
                    new SqlParameter("@Status", model.Status)
                };

                return db.Database.ExecuteSqlCommand("uspInsertProject @Id, @ProjectId, @Name, @Description, @CreatedDate, @SubmissionDate, @Submission, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteProjectStage @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Student GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Student>("uspGetProjectStage @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }

        public int ChangeStatus(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<int>("uspChangeProjectStageStatus @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return -1; }
        }
    }
}

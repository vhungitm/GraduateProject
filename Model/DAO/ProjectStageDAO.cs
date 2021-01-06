using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ProjectStageDAO
    {
        DBContext db;

        public ProjectStageDAO()
        {
            db = new DBContext();
        }

        public List<ProjectStage> GetProjectStages(long projectId, string name)
        {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@ProjectId", projectId),
                    new SqlParameter("@Name", name)
                };

            return db.Database.SqlQuery<ProjectStage>("uspGetProjectStages @ProjectId, @Name", sqlParameters).ToList();
        }

        public ProjectStage GetProjectStage(long id)
        {
            SqlParameter sqlParameter = new SqlParameter("@Id", id);

            return db.Database.SqlQuery<ProjectStage>("uspGetProjectStage @Id", sqlParameter).SingleOrDefault();
        }

        public int Insert(ProjectStage entity)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@ProjectId", entity.ProjectId),
                new SqlParameter("@Name", entity.Name),
                new SqlParameter("@StartDate", entity.StartDate),
                new SqlParameter("@EndDate", entity.EndDate),
                new SqlParameter("@Intent", entity.Intent),
                new SqlParameter("@Request", entity.Request)
            };

            return db.Database.ExecuteSqlCommand("uspInsertProjectStage @ProjectId, @Name, @StartDate, @EndDate, @Intent, @Request", sqlParameters);
        }

        public int Update (ProjectStage entity)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@Id", entity.Id),
                new SqlParameter("@Name", entity.Name != null ? entity.Name : ""),
                new SqlParameter("@StartDate", entity.StartDate != null ? entity.StartDate : ""),
                new SqlParameter("@EndDate", entity.EndDate != null ? entity.EndDate : ""),
                new SqlParameter("@Intent", entity.Intent != null ? entity.Intent : ""),
                new SqlParameter("@Request", entity.Request != null ? entity.Request : ""),
                new SqlParameter("@Submission", entity.Submission != null ? entity.Submission : ""),
                new SqlParameter("@Comment", entity.Comment != null ? entity.Comment : ""),
                new SqlParameter("@Status", entity.Status != null ? (entity.Status == true ? 1 : 0 ) : -1)
            };

            return db.Database.ExecuteSqlCommand("uspUpdateProjectStage @Id, @Name, @StartDate, @EndDate, @Intent, @Request, @Submission, @Comment, @Status", sqlParameters);
        }

        public int Delete(long id)
        {
            SqlParameter sqlParameter = new SqlParameter("@Id", id);

            return db.Database.ExecuteSqlCommand("uspDeleteProjectStage @Id", sqlParameter);
        }
    }
}

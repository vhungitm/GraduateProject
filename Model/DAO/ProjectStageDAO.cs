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

        public List<ProjectStage> Get(long id, long projectId, string name)
        {
            try
            {
                SqlParameter[] sqlParameters = new SqlParameter[]
                {
                    new SqlParameter("@Id", id),
                    new SqlParameter("@ProjectId", projectId),
                    new SqlParameter("@Name", name)
                };

                return db.Database.SqlQuery<ProjectStage>("uspGetProjectStages @Id, @ProjectId, @Name", sqlParameters).ToList();
            }
            catch (Exception) { return new List<ProjectStage>(); }
        }

        public int Insert(ProjectStage entity)
        {
            try
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
            catch (Exception) { return 0; }
        }

        public int Update (ProjectStage entity)
        {
            try
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
                    new SqlParameter("@Comment", entity.Comment != null ? entity.Comment : "")
                };

                return db.Database.ExecuteSqlCommand("uspUpdateProjectStage @Id, @Name, @StartDate, @EndDate, @Intent, @Request, @Submission, @Comment", sqlParameters);
            } catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sqlParameter = new SqlParameter("@Id", id);

                return db.Database.ExecuteSqlCommand("uspDeleteProjectStage @Id", sqlParameter);
            } catch (Exception) { return 0; }
        }
    }
}

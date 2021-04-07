using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ProjectTypeDAO
    {
        DBContext db;

        public ProjectTypeDAO()
        {
            db = new DBContext();
        }

        public List<ProjectType> Get()
        {
            try
            {
                return db.Database.SqlQuery<ProjectType>("uspGetProjectType").ToList();
            }
            catch (Exception)
            {
                return new List<ProjectType>();
            }
        }
    }
}

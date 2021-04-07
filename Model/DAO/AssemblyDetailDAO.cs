using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model.EF;

namespace Model.DAO
{
    public class AssemblyDetailDAO
    {
        DBContext db;

        public AssemblyDetailDAO()
        {
            db = new DBContext();
        }

        public List<AssemblyDetail> Get(long id)
        {
            SqlParameter sqlParameter = new SqlParameter("@Id", id);

            return db.Database.SqlQuery<AssemblyDetail>("uspGetAssemblyDetails @Id", sqlParameter).ToList();
        }
    }
}

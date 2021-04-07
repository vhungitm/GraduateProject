using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    
    public class UserDAO
    {
        DBContext db;

        public UserDAO()
        {
            db = new DBContext();
        }
        

        public int Login(string username, string password, int type)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@Username", username),
                new SqlParameter("@Password", password),
                new SqlParameter("@Type", type),
            };

            return db.Database.SqlQuery<int>("uspLogin @Username, @Password, @Type", sqlParameters).SingleOrDefault();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model.EF;

namespace Model.DAO
{
    public class AssemblyDAO
    {
        DBContext db;

        public AssemblyDAO()
        {
            db = new DBContext();
        }

        public List<Assembly> Get(long id)
        {
            SqlParameter sqlParameter = new SqlParameter("@Id", id);

            return db.Database.SqlQuery<Assembly>("uspGetAssembly @Id", sqlParameter).ToList();
        }

        public int Insert(Assembly assembly, List<AssemblyDetail> assemblyDetails)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@Id", assembly.Id),
                new SqlParameter("@Name", assembly.Name),
                new SqlParameter("@LecturerId1", assemblyDetails[0].LecturerId),
                new SqlParameter("@LecturerId2", assemblyDetails[1].LecturerId),
            };

            return db.Database.SqlQuery<int>("uspInsertAssembly @Id, @Name, @LecturerId1, @LecturerId2", sqlParameters).SingleOrDefault();
        }

        public int Update(Assembly assembly, List<AssemblyDetail> assemblyDetails)
        {
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter("@Id", assembly.Id),
                new SqlParameter("@Name", assembly.Name == null ? "" : assembly.Name),
                new SqlParameter("@Point", assemblyDetails[0].Point == null ? -1 : assemblyDetails[0].Point),
                new SqlParameter("@LecturerId1", assemblyDetails[1].LecturerId == null ? "" : assemblyDetails[1].LecturerId),
                new SqlParameter("@Point1", assemblyDetails[1].Point == null ? -1 : assemblyDetails[1].Point),
                new SqlParameter("@LecturerId2", assemblyDetails[2].LecturerId == null ? "" : assemblyDetails[2].LecturerId),
                new SqlParameter("@Point2", assemblyDetails[2].Point == null ? -1 : assemblyDetails[2].Point),
            };

            return db.Database.SqlQuery<int>("uspUpdateAssembly @Id, @Name, @Point, @LecturerId1, @Point1, @LecturerId2, @Point2", sqlParameters).SingleOrDefault();
        }

        public int Delete(long id)
        {
            SqlParameter sqlParameter = new SqlParameter("@Id", id);

            return db.Database.ExecuteSqlCommand("uspDeleteAssembly @Id", sqlParameter);
        }
    }
}

using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;
using Model.ViewModel;

namespace Model.DAO
{
    public class StudentDAO
    {
        DBContext db;
        public StudentDAO()
        {
            db = new DBContext();
        }

        public List<Student> GetStudents(string search, string faculty, string branch, string className, int status, int page, int pageSize)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Search", search),
                    new SqlParameter("@Faculty", faculty),
                    new SqlParameter("@Branch", branch),
                    new SqlParameter("@Class", className),
                    new SqlParameter("@Status", status),
                    new SqlParameter("@Page", page),
                    new SqlParameter("@PageSize", pageSize)
                };

                return db.Database.SqlQuery<Student>("uspGetStudents @Search, @Faculty, @Branch, @Class, @Status, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Student model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Username", model.Username),
                    new SqlParameter("@Password", model.Password),
                    new SqlParameter("@Avatar", model.Avatar),
                    new SqlParameter("@FullName", model.FullName),
                    new SqlParameter("@Gender", model.Gender),
                    new SqlParameter("@Birthday", model.Birthday),
                    new SqlParameter("@Address", model.Address),
                    new SqlParameter("@Phone", model.Phone),
                    new SqlParameter("@Email", model.Email),
                    new SqlParameter("@ClassId", model.ClassId),
                    new SqlParameter("@Status", model.Status),
                };

                return db.Database.ExecuteSqlCommand("uspInsertStudent @Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @ClassId, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Student model)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Id", model.Id),
                    new SqlParameter("@Username", model.Username),
                    new SqlParameter("@Password", model.Password),
                    new SqlParameter("@Avatar", model.Avatar),
                    new SqlParameter("@FullName", model.FullName),
                    new SqlParameter("@Gender", model.Gender),
                    new SqlParameter("@Birthday", model.Birthday),
                    new SqlParameter("@Address", model.Address),
                    new SqlParameter("@Phone", model.Phone),
                    new SqlParameter("@Email", model.Email),
                    new SqlParameter("@ClassId", model.ClassId),
                    new SqlParameter("@Status", model.Status),
                };

                return db.Database.ExecuteSqlCommand("uspUpdateStudent @Id, @Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @ClassId, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteStudent @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Student GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Student>("uspGetStudent @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }

        public int ChangeStatus(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<int>("uspChangeStudentStatus @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return -1; }
        }
    }
}

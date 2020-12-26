using System.Collections.Generic;
using System.Linq;
using Model.EF;
using System.Data.SqlClient;
using System;

namespace Model.DAO
{
    public class LecturerDAO
    {
        DBContext db;
        public LecturerDAO()
        {
            db = new DBContext();
        }

        public List<Lecturer> GetLecturers(string search, int status, int page, int pageSize)
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

                return db.Database.SqlQuery<Lecturer>("uspGetLecturers @Search, @Status, @Page, @PageSize", sp).ToList();
            }
            catch (Exception) { return null; }
        }

        public int Insert(Lecturer model)
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
                    new SqlParameter("@FacultyId", model.FacultyId),
                    new SqlParameter("@Status", model.Status),
                };

                return db.Database.ExecuteSqlCommand("uspInsertLecturer @Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @FacultyId, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Update(Lecturer model)
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
                    new SqlParameter("@FacultyId", model.FacultyId),
                    new SqlParameter("@Status", model.Status),
                };

                return db.Database.ExecuteSqlCommand("uspUpdateLecturer @Id, @Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @FacultyId, @Status", sp);
            }
            catch (Exception) { return 0; }
        }

        public int Delete(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.ExecuteSqlCommand("uspDeleteLecturer @Id", sp);
            }
            catch (Exception) { return 0; }
        }

        public Lecturer GetDetail(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<Lecturer>("uspGetLecturer @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return null; }
        }

        public int ChangeStatus(long id)
        {
            try
            {
                SqlParameter sp = new SqlParameter("@Id", id);
                return db.Database.SqlQuery<int>("uspChangeLecturerStatus @Id", sp).SingleOrDefault();
            }
            catch (Exception) { return -1; }
        }
    }
}

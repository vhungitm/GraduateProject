using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using Web.Common;

namespace Web.Areas.API.Controllers
{
    public class UserController : Controller
    {
        public JsonResult Login(string username, string password, int type = 0)
        {
            password = Encryptor.MD5Hash(password);

            var dao = new UserDAO();
            var status = dao.Login(username, password, type);

            if (status > 1)
            {
                var data = (new LecturerDAO()).Get(username, "", "", "", 0, 0)[0];
                
                var user = new User();
                user.Id = data.Id;
                user.Password = data.Password;
                user.FullName = data.FullName;
                user.Avatar = data.Avatar;
                user.Gender = data.Gender;
                user.Birthday = data.Birthday;
                user.Address = data.Address;
                user.Phone = data.Phone;
                user.Email = data.Email;
                user.FacultyId = data.FacultyId;
                user.FacultyName = data.FacultyName;
                user.BranchId = data.BranchId;
                user.BranchName = data.BranchName;
                user.GroupId = data.GroupId;

                Session["USER_SESSION"] = user;

                return Json(new
                {
                    status = status,
                    data = data
                }, JsonRequestBehavior.AllowGet);
            }
            else if (status == 1)
            {
                var data = (new StudentDAO()).Get(username, "", "", "", "", "", 0, 0)[0];

                var user = new User();
                user.Id = data.Id;
                user.Password = data.Password;
                user.FullName = data.FullName;
                user.Avatar = data.Avatar;
                user.Gender = data.Gender;
                user.Birthday = data.Birthday;
                user.Address = data.Address;
                user.Phone = data.Phone;
                user.Email = data.Email;
                user.FacultyId = data.FacultyId;
                user.FacultyName = data.FacultyName;
                user.BranchId = data.BranchId;
                user.BranchName = data.BranchName;
                user.GroupId = 1;

                Session["USER_SESSION"] = user;

                return Json(new
                {
                    status = status,
                    data = data
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new
                {
                    status = status
                }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult Logout()
        {
            if (Session["USER_SESSION"] != null)
            {
                Session["USER_SESSION"] = null;
                return Json(new
                {
                    status = 1
                });
            } else
            {
                return Json(new
                {
                    status = -1
                });
            }
        }
    }
}
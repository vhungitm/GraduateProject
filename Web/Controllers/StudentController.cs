using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Web.Controllers
{
    public class StudentController : Controller
    {
        public JsonResult GetStudent(string fullName = "", string username = "", long facultyId = 0, long branchId = 0, long classId = 0, long trainingSystemId = 0, int page = 0, int pageSize = 0)
        {
            var dao = new StudentDAO();
            var data = dao.GetStudent(fullName, username, facultyId, 3, classId, trainingSystemId, page, pageSize);
            var status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
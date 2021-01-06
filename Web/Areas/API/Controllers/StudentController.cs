using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Web.Areas.API.Controllers
{
    public class StudentController : Controller
    {
        StudentDAO dao = new StudentDAO();

        public JsonResult GetStudents(string id = "", string fullName = "", string facultyId = "", string branchId = "", string classId = "", string trainingSystemId = "", int page = 0, int pageSize = 0)
        {
            var data = dao.GetStudents(id, fullName, facultyId, branchId, classId, trainingSystemId, page, pageSize);
            var status = data != null ? true : false;
            var totalRow = dao.CountStudent(id, fullName, facultyId, branchId, classId, trainingSystemId);

            return Json(new
            {
                status = status,
                data = data,
                totalRow = totalRow
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStudent(string id)
        {
            var data = dao.GetStudent(id);
            var status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
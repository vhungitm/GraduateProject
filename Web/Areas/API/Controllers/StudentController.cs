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

        public JsonResult Get(string id = "", string fullName = "", string facultyId = "", string branchId = "", string classId = "", string trainingSystemId = "", int page = 0, int pageSize = 0)
        {
            List<Student> data = dao.Get(id, fullName, facultyId, branchId, classId, trainingSystemId, page, pageSize);
            long totalRow = dao.Count(id, fullName, facultyId, branchId, classId, trainingSystemId);
            bool status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data,
                totalRow = totalRow
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
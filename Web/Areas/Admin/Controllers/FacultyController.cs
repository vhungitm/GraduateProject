using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.Admin.Controllers
{
    public class FacultyController : Controller
    {
        FacultyDAO dao = new FacultyDAO();

        // GET: Admin/Faculty
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetFaculties()
        {
            var data = dao.getFaculties("", 1, 100);
            bool status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
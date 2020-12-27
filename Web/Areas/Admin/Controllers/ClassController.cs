using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.Admin.Controllers
{
    public class ClassController : Controller
    {
        ClassDAO dao = new ClassDAO();

        // GET: Admin/Faculty
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetClasses(string search = "", string faculty = "", string branch = "", string trainingSystem = "", int page = 1, int pageSize = 100)
        {
            var data = dao.GetClasses("", faculty, branch, trainingSystem, page, pageSize);
            bool status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
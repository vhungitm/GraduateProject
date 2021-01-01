using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Web.Controllers
{
    public class ProjectController : Controller
    {
        ProjectDAO dao = new ProjectDAO();

        // GET: Project
        public ActionResult My()
        {
            return View();
        }

        public ActionResult Detail(long id)
        {
            Project model = dao.GetProject(id, "", "", "", 0, 0, 0, 0, 0, 0, 0);
            return View(model);
        }

        public JsonResult GetProjects(string name = "", string student = "", long projectTypeId = 0, int year = 0, long classId = 0, int page = 0, int pageSize = 0)
        {
            var data = dao.GetProjects(name, student, "GV74801030126", projectTypeId, year, 0, 0, classId, page, pageSize);
            var totalRow = dao.CountProject(name, student, "GV74801030126", projectTypeId, year, 0, 0, classId);
            var status = totalRow > -1 ? true : false;

            return Json(new
            {
                status = status,
                data = data,
                totalRow = totalRow
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Insert(Project model)
        {
            model.LecturerId = 1;

            var status = dao.Insert(model);

            return Json(new
            {
                status = status
            });
        }

        [HttpPost]
        public JsonResult Delete(long id)
        {
            var status = dao.Delete(id);

            return Json(new
            {
                status = status
            });
        }
    }
}
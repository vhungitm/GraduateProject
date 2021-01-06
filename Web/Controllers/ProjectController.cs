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
            ViewBag.Id = id;
            return View();
        }

    }
}
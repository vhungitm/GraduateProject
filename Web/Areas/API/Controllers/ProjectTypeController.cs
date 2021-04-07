using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.API.Controllers
{
    public class ProjectTypeController : Controller
    {
        ProjectTypeDAO dao = new ProjectTypeDAO();

        public JsonResult Get()
        {

            List<ProjectType> data = dao.Get();
            bool status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
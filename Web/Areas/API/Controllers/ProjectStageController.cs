using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.API.Controllers
{
    public class ProjectStageController : Controller
    {
        ProjectStageDAO dao = new ProjectStageDAO();

        [HttpGet]
        public JsonResult Get(long id = 0, long projectId = 0, string name = "")
        {
            var data = dao.Get(id, projectId, name);
            var status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Insert(ProjectStage model)
        {
            var status = dao.Insert(model);

            return Json(new
            {
                status = status
            });

        }

        [HttpPost]
        public JsonResult Update(ProjectStage model)
        {
            var status = dao.Update(model);

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
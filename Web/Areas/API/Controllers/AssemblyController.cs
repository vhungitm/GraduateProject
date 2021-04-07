using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.API.Controllers
{
    public class AssemblyController : Controller
    {
        AssemblyDAO dao = new AssemblyDAO();

        [HttpGet]
        public JsonResult Get(long id)
        {
            List<Assembly> data = dao.Get(id);

            bool status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Insert(Assembly assembly, List<AssemblyDetail> assemblyDetails)
        {
            var status = dao.Insert(assembly, assemblyDetails);

            return Json(new
            {
                status = status
            });
        }

        [HttpPost]
        public JsonResult Update(Assembly assembly, List<AssemblyDetail> assemblyDetails)
        {
            var status = dao.Update(assembly, assemblyDetails);

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
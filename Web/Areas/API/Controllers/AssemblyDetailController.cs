using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Web.Areas.API.Controllers
{
    public class AssemblyDetailController : Controller
    {
        AssemblyDetailDAO dao = new AssemblyDetailDAO();

        [HttpGet]
        public JsonResult Get(long id)
        {
            Assembly assembly = new AssemblyDAO().Get(id).SingleOrDefault();
            List<AssemblyDetail> assemblyDetails = dao.Get(id);
            

            return Json(new
            {
                data = new { assembly, assemblyDetails }
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
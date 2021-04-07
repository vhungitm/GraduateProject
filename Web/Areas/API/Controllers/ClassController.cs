using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.API.Controllers
{
    public class ClassController : Controller
    {
        ClassDAO dao = new ClassDAO();

        public JsonResult Get(string id = "", string facultyId = "", string branchId = "", int page = 0, int pageSize = 0)
        {

            List<Class> data = dao.Get(id, facultyId, branchId, page, pageSize);
            bool status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.Admin.Controllers
{
    public class BranchController : Controller
    {
        BranchDAO dao = new BranchDAO();

        // GET: Admin/Branch
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetBranches(string search, string faculty, int page = 1, int pageSize = 5)
        {
            var data = dao.getBranches("", faculty, page, pageSize);
            bool status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OfficeOpenXml;
using Model.EF;
using Model.DAO;
using OfficeOpenXml.Style;

namespace Web.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return Redirect("/");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Controllers
{
    public class UserController : Controller
    {
        public ActionResult Login()
        {
            return View();
        }
    }
}
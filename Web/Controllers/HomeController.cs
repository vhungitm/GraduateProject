using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;

namespace Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var user = (User) Session["USER_SESSION"];
            if (user != null)
            {
                if (user.GroupId == 3)
                {
                    return Redirect("/Admin/Project");
                } 
                else
                {
                    return Redirect("/Project/My");
                }  
            }
            else return View();
            
        }
    }
}
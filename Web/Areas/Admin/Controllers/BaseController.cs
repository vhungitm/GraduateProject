using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Model.EF;

namespace Web.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (User)Session["USER_SESSION"];
            if (session == null)
            {
                filterContext.Result = new RedirectResult("/404");
            } else
            {
                if (session.GroupId != 3)
                {
                    filterContext.Result = new RedirectResult("/404");
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
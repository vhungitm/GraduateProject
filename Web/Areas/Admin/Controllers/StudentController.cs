using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Web.Areas.Admin.Controllers
{
    public class StudentController : Controller
    {
        // GET: Admin/Student
        StudentDAO dao = new StudentDAO();

        [HttpGet]
        public ActionResult Index()
        {
            
            return View();
        }

        [HttpGet]
        public JsonResult LoadData(string search, int status, int page = 1, int pageSize = 5)
        {
            var data = dao.GetStudents(search, status, page, pageSize);

            return Json(new
            {
                status = true,
                data = data,
                totalRow = data.Count()
            }, JsonRequestBehavior.AllowGet); ;
        }

        [HttpPost]
        public JsonResult SaveData(Student model)
        {
            int result = 0;
            
            if (model.Id == 0)
            {
                // Thêm mới
                result = dao.Insert(model);
            }
            else
            {
                // Cập nhật
                result = dao.Update(model);
            }
             
            return Json(new
            {
                status = result,
            });
        }

        [HttpPost]
        public JsonResult Delete(long[] id)
        {
            var dao = new StudentDAO();
            long [] result = new long[id.Length];

            for (int i = 0; i < id.Length; i++)
            {
                result[i] = dao.Delete(id[i]);
            }

            return Json(new
            {
                status = true,
                result = result
            });
        }

        [HttpGet]
        public JsonResult LoadDetail(long id)
        {
            var detail = new StudentDAO().GetDetail(id);

            var status = detail == null ? 0 : 1;
            return Json(new {
                status = status,
                data = detail
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new StudentDAO().ChangeStatus(id);

            return Json(new
            {
                status = true,
                result = result
            });
        }
    }
}
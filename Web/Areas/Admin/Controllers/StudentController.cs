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
        public JsonResult GetStudents(string search = "", string faculty = "", string branch = "", string className = "", int status = 2, int page = 1, int pageSize = 100)
        {
            try
            {
                var data = dao.GetStudents(search, faculty, branch, className, status, page, pageSize);

                return Json(new
                {
                    status = true,
                    data = data,
                    totalRow = data.Count()
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new
                {
                    status = false
                });
            }
        }

        [HttpPost]
        public JsonResult SaveData(Student model)
        {
            int status = 0;

            if (model.Id == 0)
            {
                // Thêm mới
                status = dao.Insert(model);
            }
            else
            {
                // Cập nhật
                status = dao.Update(model);
            }
             
            return Json(new
            {
                status = status,
            });
        }

        [HttpPost]
        public JsonResult Delete(long[] id)
        {
            try
            {
                var dao = new StudentDAO();
                long[] result = new long[id.Length];

                for (int i = 0; i < id.Length; i++)
                {
                    result[i] = dao.Delete(id[i]);
                }

                return Json(new
                {
                    status = true,
                    result = result
                });
            } catch (Exception) {
                return Json(new
                {
                    status = false
                });
            }
        }

        [HttpGet]
        public JsonResult getStudent(long id)
        {
            try
            {
                var data = new StudentDAO().GetStudent(id);

                return Json(new
                {
                    status = true,
                    data = data
                }, JsonRequestBehavior.AllowGet);
            } catch (Exception)
            {
                return Json(new
                {
                    status = false
                });
            }
        }

        [HttpGet]
        public JsonResult ChangeStatus(long id)
        {
            int result = new StudentDAO().ChangeStatus(id);
            bool status = result != -1 ? true : false;

            return Json(new
            {
                status = status,
                result = result
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
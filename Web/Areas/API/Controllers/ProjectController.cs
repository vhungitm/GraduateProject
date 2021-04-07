using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Web.Areas.API
{
    public class ProjectController : Controller
    {
        ProjectDAO dao = new ProjectDAO();

        public JsonResult Get(long id = 0, string name = "", string student = "", string lecturer = "", int projectTypeId = 0, int year = 0, string facultyId = "", string branchId = "", string classId = "", int pointStatus = 2, int page = 0, int pageSize = 0)
        {
            List<Project> data = dao.Get(id, name, student, lecturer, projectTypeId, year, facultyId, branchId, classId, pointStatus, page, pageSize);
            long totalRow = dao.Count(id, name, student, lecturer, projectTypeId, year, facultyId, branchId, classId, pointStatus);
            bool status = data.Count() > 0 ? true : false;

            return Json(new
            {
                status = status,
                data = data,
                totalRow = totalRow
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Insert(Project model)
        {
            var status = dao.Insert(model);

            return Json(new
            {
                status = status
            });
        }

        [HttpPost]
        public JsonResult Update(Project model)
        {
            var status = dao.Update(model);

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

        [HttpPost]
        public JsonResult DeleteSelection(long [] id)
        {
            int[] data = new int[id.Length];

            for (int i = 0; i < id.Length; i++)
            {
                data[i] = dao.Delete( id[i] );
            }

            return Json(new
            {
                status = true,
                data = data
            });
        }
    }
}
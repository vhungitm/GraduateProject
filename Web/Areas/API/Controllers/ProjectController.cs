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

        public JsonResult GetProject(long id)
        {
            var data = dao.GetProject(id);
            var status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProjects(string name = "", string student = "", string lecturer = "", int projectTypeId = 0, int year = 0, string facultyId = "", string branchId = "", string classId = "", int page = 0, int pageSize = 0)
        {
            var data = dao.GetProjects(name, student, lecturer, projectTypeId, year, facultyId, branchId, classId, page, pageSize);
            var totalRow = dao.CountProject(name, student, lecturer, projectTypeId, year, facultyId, branchId, classId);
            var status = totalRow > -1 ? true : false;

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

        [HttpGet]
        public JsonResult GetProjectStages(long projectId = 0, string name = "")
        {
            var dao = new ProjectStageDAO();

            var data = dao.GetProjectStages(projectId, name);
            var status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetProjectStage(long id = 0)
        {
            var dao = new ProjectStageDAO();

            var data = dao.GetProjectStage(id);
            var status = data != null ? true : false;

            return Json(new
            {
                status = status,
                data = data
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult InsertProjectStage(ProjectStage model)
        {
            var dao = new ProjectStageDAO();
            var status = dao.Insert(model);

            return Json(new
            {
                status = status
            });

        }

        [HttpPost]
        public JsonResult UpdateProjectStage(ProjectStage model)
        {
            var dao = new ProjectStageDAO();
            var status = dao.Update(model);

            return Json(new
            {
                status = status
            });

        }

        [HttpPost]
        public JsonResult DeleteProjectStage(long id)
        {
            var dao = new ProjectStageDAO();
            var status = dao.Delete(id);

            return Json(new
            {
                status = status
            });
        }
    }
}
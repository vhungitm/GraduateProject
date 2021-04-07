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
    public class ProjectController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public void ExportExcel(long id = 0, string student = "", string lecturer = "", long projectTypeId = 0, int year = 0, string classId = "", int pointStatus = 2)
        {
            User user = (User)Session["USER_SESSION"];

            ProjectDAO projectDAO = new ProjectDAO();
            List<Project> projects = projectDAO.Get(0, "", student, lecturer, projectTypeId, year, "", user.BranchId, classId, pointStatus, 0, 0);

            ExcelPackage excelPackage = new ExcelPackage();
            ExcelWorksheet sheet = excelPackage.Workbook.Worksheets.Add("Report");

            // Title
            int rowTitle = 1;

            sheet.Cells["A" + rowTitle].Value = "DANH SÁCH ĐỀ TÀI " + ((projectTypeId == 1 ? "ĐỒ ÁN TỐT NGHIỆP" : (projectTypeId == 2 ? "KHOÁ LUẬN TỐT NGHIỆP" : "")));

            // Table Header
            int rowHeader = 3;

            sheet.Cells["A" + rowHeader].Value = "STT";
            sheet.Cells["B" + rowHeader].Value = "Họ tên";
            sheet.Cells["C" + rowHeader].Value = "MSSV";
            sheet.Cells["D" + rowHeader].Value = "Lớp";
            sheet.Cells["E" + rowHeader].Value = "Tên đề tài";
            sheet.Cells["F" + rowHeader].Value = "GVHD";
            
            if (pointStatus != 0)
            {
                sheet.Cells["G" + rowHeader].Value = "Hội đồng";
                sheet.Cells["H" + rowHeader].Value = "Điểm chủ tịch";
                sheet.Cells["I" + rowHeader].Value = "Điểm thành viên";
                sheet.Cells["J" + rowHeader].Value = "Điểm thư ký";
                sheet.Cells["K" + rowHeader].Value = "Điểm trung bình";
            }

            // Print data table
            int row = 4;
            int stt = 1;

            foreach (var item in projects)
            {
                sheet.Cells["A" + row].Value = stt++;
                sheet.Cells["B" + row].Value = item.StudentName;
                sheet.Cells["C" + row].Value = item.StudentId;
                sheet.Cells["D" + row].Value = item.ClassId;
                sheet.Cells["E" + row].Value = item.Name;
                sheet.Cells["F" + row].Value = item.LecturerName;

                sheet.Cells["A" + row + ":A" + (row + 2)].Merge = true;
                sheet.Cells["B" + row + ":B" + (row + 2)].Merge = true;
                sheet.Cells["C" + row + ":C" + (row + 2)].Merge = true;
                sheet.Cells["D" + row + ":D" + (row + 2)].Merge = true;
                sheet.Cells["E" + row + ":E" + (row + 2)].Merge = true;
                sheet.Cells["F" + row + ":F" + (row + 2)].Merge = true;

                // Assembly //
                AssemblyDetailDAO assemblyDetailDAO = new AssemblyDetailDAO();
                List<AssemblyDetail> assembly = assemblyDetailDAO.Get(item.Id);

                if (pointStatus != 0)
                {
                    sheet.Cells["G" + row].Value = "Chủ tịch: " + assembly[1].LecturerName;
                    sheet.Cells["G" + (row + 1)].Value = "Thành viên: " + assembly[2].LecturerName;
                    sheet.Cells["G" + (row + 2)].Value = "Thư ký: " + assembly[0].LecturerName;
                    sheet.Cells["H" + row].Value = assembly[1].Point;
                    sheet.Cells["I" + row].Value = assembly[2].Point;
                    sheet.Cells["J" + row].Value = assembly[0].Point;
                    sheet.Cells["K" + row].Value = item.Point;

                    sheet.Cells["H" + row + ":H" + (row + 2)].Merge = true;
                    sheet.Cells["I" + row + ":I" + (row + 2)].Merge = true;
                    sheet.Cells["J" + row + ":J" + (row + 2)].Merge = true;
                    sheet.Cells["K" + row + ":K" + (row + 2)].Merge = true;
                }

                row += 3;
            }

            string endColumnName = pointStatus != 0 ? "K" : "F";
            int endColumn = pointStatus != 0 ? 11 : 6;

            // Draw table line
            for (int i = rowHeader; i < row; i++)
            {
                for (int j = 1; j <= endColumn; j++)
                {
                    sheet.Cells[i,j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                }
            }

            // Style all
            sheet.Cells["A:AZ"].Style.Font.Name = "Times New Roman";
            sheet.Cells["A:AZ"].Style.Font.Size = 13;
            sheet.Cells["A:AZ"].Style.WrapText = true;

            // Style title
            sheet.Cells["A" + rowTitle + ":" + endColumnName + rowTitle].Merge = true;
            sheet.Cells["A" + rowTitle + ":" + endColumnName + rowTitle].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            sheet.Cells["A" + rowTitle + ":" + endColumnName + rowTitle].Style.Font.Size = 16;
            sheet.Cells["A" + rowTitle + ":" + endColumnName + rowTitle].Style.Font.Bold = true;
            sheet.Cells["A" + (rowTitle + 1) + ":" + endColumnName + (rowTitle + 1)].Merge = true;
            
            // Style table header

            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.Fill.PatternType = ExcelFillStyle.Solid;
            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(48,84,150));
            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.Font.Color.SetColor(System.Drawing.Color.White);
            sheet.Cells["A" + rowHeader + ":" + endColumnName + rowHeader].Style.Font.Bold = true;
            
            // Style data row
            sheet.Cells["A" + (rowHeader + 1) + ":A" + row].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            sheet.Cells["A" + (rowHeader + 1) + ":G" + row].Style.VerticalAlignment = ExcelVerticalAlignment.Top;

            if (pointStatus != 0)
            {
                sheet.Cells["H" + (rowHeader + 1) + ":" + endColumnName + row].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                sheet.Cells["H" + (rowHeader + 1) + ":" + endColumnName + row].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            }

            
            // Set size column
            sheet.Column(1).Width    = 7;
            sheet.Column(2).Width    = 20;
            sheet.Column(3).Width    = 20;
            sheet.Column(4).Width    = 15;
            sheet.Column(5).Width    = 40;
            sheet.Column(6).Width    = 20;
            sheet.Column(7).Width    = 30;
            
            if (endColumn > 7)
            {
                sheet.Column(8).Width = 10;
                sheet.Column(9).Width = 10;
                sheet.Column(10).Width = 10;
                sheet.Column(11).Width = 10;
            }

            // Set size row
            sheet.Row(3).Height = 55;

            // Set file infor
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "Report.xlsx");
            Response.BinaryWrite(excelPackage.GetAsByteArray());
            Response.End();

        }
    }
}
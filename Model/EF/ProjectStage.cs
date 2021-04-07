namespace Model.EF
{
    using System.Web.Mvc;

    public class ProjectStage
    {
        public long Id { get; set; }

        public long ProjectId { get; set; }

        public string Name { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        [AllowHtml]
        public string Intent { get; set; }

        [AllowHtml]
        public string Request { get; set; }

        public string SubmissionDate { get; set; }

        public string Submission { get; set; }

        [AllowHtml]
        public string Comment { get; set; }
    }
}

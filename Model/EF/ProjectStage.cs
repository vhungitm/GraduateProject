namespace Model.EF
{
    public class ProjectStage
    {
        public long Id { get; set; }

        public long ProjectId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string CreatedDate { get; set; }

        public string EndDate { get; set; }

        public string SubmissionDate { get; set; }

        public string Submission { get; set; }

        public string Comment { get; set; }

        public bool Status { get; set; }
    }
}

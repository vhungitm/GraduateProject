namespace Model.EF
{
    public class Project
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public long TypeId { get; set; }

        public string Type { get; set; }

        public long StudentId { get; set; }

        public string Student { get; set; }

        public long LecturerId { get; set; }

        public string Lecturer { get; set; }

        public string CreatedDate { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        public string SubmissionDate { get; set; }

        public string Submission { get; set; }

        public double? Point { get; set; }
    }
}

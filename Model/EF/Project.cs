namespace Model.EF
{
    public class Project
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public long TypeId { get; set; }

        public long StudentId { get; set; }

        public long LecturerId { get; set; }

        public string SubmissionDate { get; set; }

        public string Submission { get; set; }

        public double? Point { get; set; }
    }
}

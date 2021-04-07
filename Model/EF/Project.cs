namespace Model.EF
{
    public class Project
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public long? TypeId { get; set; }

        public string TypeName { get; set; }

        public string StudentId { get; set; }

        public string StudentName { get; set; }

        public string ClassId { get; set; }

        public string LecturerId { get; set; }

        public string LecturerName { get; set; }

        public string CreatedDate { get; set; }

        public string StartDate { get; set; }

        public string EndDate { get; set; }

        public string AssemblyName { get; set; }
        
        public string AssemblyCreatedDate { get; set; }

        public string SubmissionDate { get; set; }

        public string Submission { get; set; }

        public double? Point { get; set; }
    }
}

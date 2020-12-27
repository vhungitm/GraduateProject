namespace Model.EF
{
    public class Class
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public int Size { get; set; }

        public long FacultyId { get; set; }

        public string Faculty { get; set; }

        public long BranchId { get; set; }

        public string Branch { get; set; }

        public long TrainingSystemId { get; set; }

        public string TrainingSystem { get; set; }

        public string CollegeYear { get; set; }
    }
}

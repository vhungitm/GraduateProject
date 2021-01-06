namespace Model.EF
{
    public class Student
    {
        public string Id { get; set; }

        public string Password { get; set; }

        public string Avatar { get; set; }

        public string FullName { get; set; }

        public string Gender { get; set; }

        public string Birthday { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string ClassId { get; set; }

        public string BranchId { get; set; }

        public string BranchName { get; set; }

        public string FacultyId { get; set; }

        public string FacultyName { get; set; }

        public string TrainingSystemId { get; set; }

        public string TrainingSystemName { get; set; }

        public string CollegeYear { get; set; }

        public bool Status { get; set; }
    }
}

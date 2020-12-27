namespace Model.EF
{
    public class Student
    {
        public long Id { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Avatar { get; set; }

        public string FullName { get; set; }

        public string Gender { get; set; }

        public string Birthday { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public long ClassId { get; set; }

        public string Class { get; set; }

        public string Branch { get; set; }

        public string Faculty { get; set; }

        public string TranningSystem { get; set; }

        public string CollegeYear { get; set; }

        public bool Status { get; set; }
    }
}

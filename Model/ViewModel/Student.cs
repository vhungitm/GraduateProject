namespace Model.ViewModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using Model.EF;

    public partial class StudentVM
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

        public virtual Class Class { get; set; }

        public bool Status { get; set; }
    }
}

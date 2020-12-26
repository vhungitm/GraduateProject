namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Project")]
    public partial class Project
    {
        public long Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public long TypeId { get; set; }

        public long StudentId { get; set; }

        public long LecturerId { get; set; }

        public DateTime? SubmissionDate { get; set; }

        [StringLength(200)]
        public string Submission { get; set; }

        public double? Point { get; set; }
    }
}

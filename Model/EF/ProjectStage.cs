namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProjectStage")]
    public partial class ProjectStage
    {
        public long Id { get; set; }

        public long ProjectId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime EndDate { get; set; }

        public DateTime? SubmissionDate { get; set; }

        [StringLength(200)]
        public string Submission { get; set; }

        public double? Comment { get; set; }

        public bool Status { get; set; }

        public virtual Project Project { get; set; }
    }
}

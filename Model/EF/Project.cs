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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            Assemblies = new HashSet<Assembly>();
            ProjectStages = new HashSet<ProjectStage>();
        }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Assembly> Assemblies { get; set; }

        public virtual Lecturer Lecturer { get; set; }

        public virtual ProjectType ProjectType { get; set; }

        public virtual Student Student { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProjectStage> ProjectStages { get; set; }
    }
}

namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProjectType")]
    public partial class ProjectType
    {
        public long Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }
    }
}

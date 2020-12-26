namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Class")]
    public partial class Class
    {
        public long Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public long BranchId { get; set; }

        public int Size { get; set; }

        public long TranningSystemId { get; set; }

        [Required]
        [StringLength(20)]
        public string CollegeYear { get; set; }
    }
}

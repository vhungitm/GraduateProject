namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBContext : DbContext
    {
        public DBContext()
            : base("name=DBContext")
        {
        }

        public virtual DbSet<Assembly> Assemblies { get; set; }
        public virtual DbSet<AssemblyDetail> AssemblyDetails { get; set; }
        public virtual DbSet<Branch> Branches { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<Faculty> Faculties { get; set; }
        public virtual DbSet<Lecturer> Lecturers { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ProjectStage> ProjectStages { get; set; }
        public virtual DbSet<ProjectType> ProjectTypes { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<TranningSystem> TranningSystems { get; set; }

    }
}

namespace Model.EF
{
    public class AssemblyDetail
    {
        public long AssemblyId { get; set; }

        public long LecturerId { get; set; }

        public string Comment { get; set; }

        public double? Point { get; set; }
    }
}

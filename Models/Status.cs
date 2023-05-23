using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Status
    {
        public Status()
        {
            Applicants = new HashSet<Applicant>();
        }

        public int IdStatus { get; set; }
        public string StatusName { get; set; } = null!;

        public virtual ICollection<Applicant> Applicants { get; set; }
    }
}

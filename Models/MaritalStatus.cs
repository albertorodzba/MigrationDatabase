using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class MaritalStatus
    {
        public MaritalStatus()
        {
            Applicants = new HashSet<Applicant>();
        }

        public int IdMaritalStatus { get; set; }
        public string MaritalStatusName { get; set; } = null!;

        public virtual ICollection<Applicant> Applicants { get; set; }
    }
}

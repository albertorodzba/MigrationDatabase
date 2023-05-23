using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Disability
    {
        public Disability()
        {
            ApplicantDisabilities = new HashSet<ApplicantDisability>();
        }

        public int IdDisability { get; set; }
        public string DisabilityName { get; set; } = null!;

        public virtual ICollection<ApplicantDisability> ApplicantDisabilities { get; set; }
    }
}

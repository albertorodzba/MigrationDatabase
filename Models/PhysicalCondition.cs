using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class PhysicalCondition
    {
        public PhysicalCondition()
        {
            ApplicantConditions = new HashSet<ApplicantCondition>();
        }

        public int IdPhysicalCondition { get; set; }
        public string PhysicalActivity { get; set; } = null!;
        public string? Rating { get; set; }

        public virtual ICollection<ApplicantCondition> ApplicantConditions { get; set; }
    }
}

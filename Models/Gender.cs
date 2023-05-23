using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Gender
    {
        public Gender()
        {
            Applicants = new HashSet<Applicant>();
        }

        public int IdGender { get; set; }
        public string GenderName { get; set; } = null!;

        public virtual ICollection<Applicant> Applicants { get; set; }
    }
}

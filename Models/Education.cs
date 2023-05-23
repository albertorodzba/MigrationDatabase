using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Education
    {
        public Education()
        {
            Applicants = new HashSet<Applicant>();
        }

        public int IdEducation { get; set; }
        public string EducationLevel { get; set; } = null!;

        public virtual ICollection<Applicant> Applicants { get; set; }
    }
}

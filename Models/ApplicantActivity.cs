using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantActivity
    {
        public long IdApplicantActivity { get; set; }
        public long? FkIdApplicant { get; set; }
        public int? FkIdActivity { get; set; }
        public int? ActivityPreference { get; set; }

        public virtual Activity? FkIdActivityNavigation { get; set; }
        public virtual Applicant? FkIdApplicantNavigation { get; set; }
    }
}

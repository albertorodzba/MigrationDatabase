using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantDesiredJob
    {
        public long IdApplicantDesiredJob { get; set; }
        public long? FkIdApplicant { get; set; }
        public int? FkIdJob { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual Job? FkIdJobNavigation { get; set; }
    }
}

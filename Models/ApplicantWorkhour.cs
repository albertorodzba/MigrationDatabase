using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantWorkhour
    {
        public long IdApplicantWorkhour { get; set; }
        public long? FkIdApplicant { get; set; }
        public int? FkIdWorkhour { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual Workhour? FkIdWorkhourNavigation { get; set; }
    }
}

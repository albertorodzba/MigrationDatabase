using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantCondition
    {
        public long IdApplicantCondition { get; set; }
        public long? FkIdApplicant { get; set; }
        public int? FkIdPhysicalCondition { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual PhysicalCondition? FkIdPhysicalConditionNavigation { get; set; }
    }
}

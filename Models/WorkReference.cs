using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class WorkReference
    {
        public long IdWorkReference { get; set; }
        public long? FkIdWorkExperience { get; set; }
        public long? FkIdApplicant { get; set; }
        public string? ReferenceName { get; set; }
        public string? ReferenceJobPosition { get; set; }
        public string? ContactNumber { get; set; }
        public string? WorkReferenceComment { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual WorkExperience? FkIdWorkExperienceNavigation { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class WorkExperience
    {
        public WorkExperience()
        {
            WorkReferences = new HashSet<WorkReference>();
        }

        public long IdWorkExperience { get; set; }
        public long? FkIdApplicant { get; set; }
        public string? JobName { get; set; }
        public string? WorkPlace { get; set; }
        public string? Activities { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string? LeavingReason { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual ICollection<WorkReference> WorkReferences { get; set; }
    }
}

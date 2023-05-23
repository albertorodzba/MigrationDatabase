using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Job
    {
        public Job()
        {
            ActivityJobs = new HashSet<ActivityJob>();
            ApplicantDesiredJobs = new HashSet<ApplicantDesiredJob>();
            DocumentJobs = new HashSet<DocumentJob>();
        }

        public int IdJob { get; set; }
        public string JobName { get; set; } = null!;

        public virtual ICollection<ActivityJob> ActivityJobs { get; set; }
        public virtual ICollection<ApplicantDesiredJob> ApplicantDesiredJobs { get; set; }
        public virtual ICollection<DocumentJob> DocumentJobs { get; set; }
    }
}

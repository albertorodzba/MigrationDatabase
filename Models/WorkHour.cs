using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Workhour
    {
        public Workhour()
        {
            ApplicantWorkhours = new HashSet<ApplicantWorkhour>();
            JobOfferWorkhours = new HashSet<JobOfferWorkhour>();
        }

        public int IdWorkhour { get; set; }
        public string Mode { get; set; } = null!;
        public string? Description { get; set; }

        public virtual ICollection<ApplicantWorkhour> ApplicantWorkhours { get; set; }
        public virtual ICollection<JobOfferWorkhour> JobOfferWorkhours { get; set; }
    }
}

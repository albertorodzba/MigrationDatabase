using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class JobExtraInfo
    {
        public JobExtraInfo()
        {
            JobOfferExtraInfos = new HashSet<JobOfferExtraInfo>();
        }

        public int IdJobExtraInfo { get; set; }
        public string ExtraInfo { get; set; } = null!;

        public virtual ICollection<JobOfferExtraInfo> JobOfferExtraInfos { get; set; }
    }
}

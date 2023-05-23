using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class JobOfferWorkhour
    {
        public long IdJobOfferWorkhour { get; set; }
        public long? FkIdJobOffer { get; set; }
        public int? FkIdWorkhour { get; set; }

        public virtual JobOffer? FkIdJobOfferNavigation { get; set; }
        public virtual Workhour? FkIdWorkhourNavigation { get; set; }
    }
}

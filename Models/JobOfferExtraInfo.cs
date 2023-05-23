using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class JobOfferExtraInfo
    {
        public long IdJobOfferExtraInfo { get; set; }
        public long? FkIdJobOffer { get; set; }
        public int? FkIdJobExtraInfo { get; set; }

        public virtual JobExtraInfo? FkIdJobExtraInfoNavigation { get; set; }
        public virtual JobOffer? FkIdJobOfferNavigation { get; set; }
    }
}

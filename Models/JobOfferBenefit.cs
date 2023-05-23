using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class JobOfferBenefit
    {
        public long IdJobOfferBenefit { get; set; }
        public long? FkIdJobOffer { get; set; }
        public int? FkIdBenefit { get; set; }

        public virtual Benefit? FkIdBenefitNavigation { get; set; }
        public virtual JobOffer? FkIdJobOfferNavigation { get; set; }
    }
}

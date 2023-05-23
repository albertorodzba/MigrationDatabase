using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class OfferBenefit
    {
        public long IdOfferBenefit { get; set; }
        public long? FkIdJobOffer { get; set; }
        public int? FkIdBenefit { get; set; }

        public virtual EmployeeBenefit? FkIdBenefitNavigation { get; set; }
        public virtual JobOffer? FkIdJobOfferNavigation { get; set; }
    }
}

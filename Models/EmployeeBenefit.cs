using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class EmployeeBenefit
    {
        public EmployeeBenefit()
        {
            OfferBenefits = new HashSet<OfferBenefit>();
        }

        public int IdBenefit { get; set; }
        public string Benefit { get; set; } = null!;

        public virtual ICollection<OfferBenefit> OfferBenefits { get; set; }
    }
}

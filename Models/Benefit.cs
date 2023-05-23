using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Benefit
    {
        public Benefit()
        {
            JobOfferBenefits = new HashSet<JobOfferBenefit>();
        }

        public int IdBenefit { get; set; }
        public string Benefit1 { get; set; } = null!;

        public virtual ICollection<JobOfferBenefit> JobOfferBenefits { get; set; }
    }
}

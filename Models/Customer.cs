using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Customer
    {
        public Customer()
        {
            JobOffers = new HashSet<JobOffer>();
        }

        public long IdCustomer { get; set; }
        public string Fullname { get; set; } = null!;
        public DateTime? BirthDate { get; set; }
        public string? Age { get; set; }
        public string? Phonenumber1 { get; set; }
        public string? Phonenumber2 { get; set; }
        public string? Occupation { get; set; }
        public bool? HaveMoreWorkers { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual ICollection<JobOffer> JobOffers { get; set; }
    }
}

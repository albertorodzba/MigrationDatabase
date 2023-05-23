using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class JobOffer
    {
        public JobOffer()
        {
            ActivityRequesteds = new HashSet<ActivityRequested>();
            JobOfferBenefits = new HashSet<JobOfferBenefit>();
            JobOfferExtraInfos = new HashSet<JobOfferExtraInfo>();
            JobOfferWorkhours = new HashSet<JobOfferWorkhour>();
        }

        public long IdJobOffer { get; set; }
        public long? FkIdCustomner { get; set; }
        public string? Description { get; set; }
        public decimal? Salary { get; set; }
        public string? WorkPlace { get; set; }
        public string? Street { get; set; }
        public string? Locality { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? ZipCode { get; set; }
        public DateTime? StartDate { get; set; }
        public int? ApplicantsForHiring { get; set; }
        public bool? ApplicantExperience { get; set; }
        public bool? ApplicantTattoosPiercings { get; set; }
        public bool? ApplicantDisability { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual Customer? FkIdCustomnerNavigation { get; set; }
        public virtual ICollection<ActivityRequested> ActivityRequesteds { get; set; }
        public virtual ICollection<JobOfferBenefit> JobOfferBenefits { get; set; }
        public virtual ICollection<JobOfferExtraInfo> JobOfferExtraInfos { get; set; }
        public virtual ICollection<JobOfferWorkhour> JobOfferWorkhours { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Applicant
    {
        public Applicant()
        {
            ApplicantActivities = new HashSet<ApplicantActivity>();
            ApplicantConditions = new HashSet<ApplicantCondition>();
            ApplicantDesiredJobs = new HashSet<ApplicantDesiredJob>();
            ApplicantDisabilities = new HashSet<ApplicantDisability>();
            ApplicantLanguages = new HashSet<ApplicantLanguage>();
            ApplicantWorkhours = new HashSet<ApplicantWorkhour>();
            PersonalFolders = new HashSet<PersonalFolder>();
            WorkExperiences = new HashSet<WorkExperience>();
            WorkReferences = new HashSet<WorkReference>();
        }

        public long IdApplicant { get; set; }
        public string Fullname { get; set; } = null!;
        public string? Aboutme { get; set; }
        public DateTime? Birthdate { get; set; }
        public string? Age { get; set; }
        public int? FkIdGender { get; set; }
        public string? Street { get; set; }
        public string? Neighborhood { get; set; }
        public string? Locality { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? ZipCode { get; set; }
        public string? Phonenumber1 { get; set; }
        public string? Phonenumber2 { get; set; }
        public bool? BodyPiercing { get; set; }
        public string? Children { get; set; }
        public bool? Tattoos { get; set; }
        public string? WeightKg { get; set; }
        public string? HeightCm { get; set; }
        public int? FkIdJobStatus { get; set; }
        public string? AdminObservation { get; set; }
        public int? FkIdMaritalStatus { get; set; }
        public int? FkEducationLevel { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual Education? FkEducationLevelNavigation { get; set; }
        public virtual Gender? FkIdGenderNavigation { get; set; }
        public virtual Status? FkIdJobStatusNavigation { get; set; }
        public virtual MaritalStatus? FkIdMaritalStatusNavigation { get; set; }
        public virtual ICollection<ApplicantActivity> ApplicantActivities { get; set; }
        public virtual ICollection<ApplicantCondition> ApplicantConditions { get; set; }
        public virtual ICollection<ApplicantDesiredJob> ApplicantDesiredJobs { get; set; }
        public virtual ICollection<ApplicantDisability> ApplicantDisabilities { get; set; }
        public virtual ICollection<ApplicantLanguage> ApplicantLanguages { get; set; }
        public virtual ICollection<ApplicantWorkhour> ApplicantWorkhours { get; set; }
        public virtual ICollection<PersonalFolder> PersonalFolders { get; set; }
        public virtual ICollection<WorkExperience> WorkExperiences { get; set; }
        public virtual ICollection<WorkReference> WorkReferences { get; set; }
    }
}

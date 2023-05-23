using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantLanguage
    {
        public long IdApplicantLanguage { get; set; }
        public long? FkIdApplicant { get; set; }
        public int? FkIdLanguage { get; set; }
        public int? LanguageLevel { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual Language? FkIdLanguageNavigation { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Language
    {
        public Language()
        {
            ApplicantLanguages = new HashSet<ApplicantLanguage>();
        }

        public int IdLanguage { get; set; }
        public string Language1 { get; set; } = null!;

        public virtual ICollection<ApplicantLanguage> ApplicantLanguages { get; set; }
    }
}

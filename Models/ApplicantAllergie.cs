using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ApplicantAllergie
    {
        public long IdApplicantAllergie { get; set; }
        public int? FkIdApplicant { get; set; }
        public long? FkIdAllergie { get; set; }
    }
}

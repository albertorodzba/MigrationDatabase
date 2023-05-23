using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class ActivityJob
    {
        public long IdActivityJob { get; set; }
        public int? FkIdActivity { get; set; }
        public int? FkIdJob { get; set; }

        public virtual Activity? FkIdActivityNavigation { get; set; }
        public virtual Job? FkIdJobNavigation { get; set; }
    }
}

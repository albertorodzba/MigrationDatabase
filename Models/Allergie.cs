using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class Allergie
    {
        public int IdAlergie { get; set; }
        public string AlergieName { get; set; } = null!;
    }
}

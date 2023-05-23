using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class DocumentJob
    {
        public long IdDocumentJob { get; set; }
        public int? FkIdJob { get; set; }
        public int? FkIdDocumentType { get; set; }

        public virtual DocumentType? FkIdDocumentTypeNavigation { get; set; }
        public virtual Job? FkIdJobNavigation { get; set; }
    }
}

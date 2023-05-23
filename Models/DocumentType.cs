using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class DocumentType
    {
        public DocumentType()
        {
            DocumentFolders = new HashSet<DocumentFolder>();
            DocumentJobs = new HashSet<DocumentJob>();
        }

        public int IdDocumentType { get; set; }
        public string DocumentName { get; set; } = null!;

        public virtual ICollection<DocumentFolder> DocumentFolders { get; set; }
        public virtual ICollection<DocumentJob> DocumentJobs { get; set; }
    }
}

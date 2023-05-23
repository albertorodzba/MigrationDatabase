using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class DocumentFolder
    {
        public DocumentFolder()
        {
            Files = new HashSet<File>();
        }

        public long IdDocumentFolder { get; set; }
        public long? FkIdPersonalFolder { get; set; }
        public int? FkIdDocumentType { get; set; }
        public string FolderUrl { get; set; } = null!;
        public string IdFolderGenerated { get; set; } = null!;

        public virtual DocumentType? FkIdDocumentTypeNavigation { get; set; }
        public virtual PersonalFolder? FkIdPersonalFolderNavigation { get; set; }
        public virtual ICollection<File> Files { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class File
    {
        public long IdFile { get; set; }
        public long? FkIdFolderDocument { get; set; }
        public string FileUrl { get; set; } = null!;
        public string FileName { get; set; } = null!;
        public string IdFileGenerated { get; set; } = null!;

        public virtual DocumentFolder? FkIdFolderDocumentNavigation { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace migrationdatabase.Models
{
    public partial class PersonalFolder
    {
        public PersonalFolder()
        {
            DocumentFolders = new HashSet<DocumentFolder>();
        }

        public long IdPersonalFolder { get; set; }
        public long? FkIdApplicant { get; set; }
        public string? FolderName { get; set; }
        public string? FolderUrl { get; set; }

        public virtual Applicant? FkIdApplicantNavigation { get; set; }
        public virtual ICollection<DocumentFolder> DocumentFolders { get; set; }
    }
}

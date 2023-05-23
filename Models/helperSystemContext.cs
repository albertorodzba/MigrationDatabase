using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace migrationdatabase.Models
{
    public partial class helperSystemContext : DbContext
    {
        public helperSystemContext()
        {
        }

        public helperSystemContext(DbContextOptions<helperSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Activity> Activities { get; set; } = null!;
        public virtual DbSet<ActivityJob> ActivityJobs { get; set; } = null!;
        public virtual DbSet<ActivityRequested> ActivityRequesteds { get; set; } = null!;
        public virtual DbSet<Allergie> Allergies { get; set; } = null!;
        public virtual DbSet<Applicant> Applicants { get; set; } = null!;
        public virtual DbSet<ApplicantActivity> ApplicantActivities { get; set; } = null!;
        public virtual DbSet<ApplicantAllergie> ApplicantAllergies { get; set; } = null!;
        public virtual DbSet<ApplicantCondition> ApplicantConditions { get; set; } = null!;
        public virtual DbSet<ApplicantDesiredJob> ApplicantDesiredJobs { get; set; } = null!;
        public virtual DbSet<ApplicantDisability> ApplicantDisabilities { get; set; } = null!;
        public virtual DbSet<ApplicantLanguage> ApplicantLanguages { get; set; } = null!;
        public virtual DbSet<ApplicantWorkhour> ApplicantWorkhours { get; set; } = null!;
        public virtual DbSet<Benefit> Benefits { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Disability> Disabilities { get; set; } = null!;
        public virtual DbSet<DocumentFolder> DocumentFolders { get; set; } = null!;
        public virtual DbSet<DocumentJob> DocumentJobs { get; set; } = null!;
        public virtual DbSet<DocumentType> DocumentTypes { get; set; } = null!;
        public virtual DbSet<Education> Educations { get; set; } = null!;
        public virtual DbSet<File> Files { get; set; } = null!;
        public virtual DbSet<Gender> Genders { get; set; } = null!;
        public virtual DbSet<Job> Jobs { get; set; } = null!;
        public virtual DbSet<JobExtraInfo> JobExtraInfos { get; set; } = null!;
        public virtual DbSet<JobOffer> JobOffers { get; set; } = null!;
        public virtual DbSet<JobOfferBenefit> JobOfferBenefits { get; set; } = null!;
        public virtual DbSet<JobOfferExtraInfo> JobOfferExtraInfos { get; set; } = null!;
        public virtual DbSet<JobOfferWorkhour> JobOfferWorkhours { get; set; } = null!;
        public virtual DbSet<Language> Languages { get; set; } = null!;
        public virtual DbSet<MaritalStatus> MaritalStatuses { get; set; } = null!;
        public virtual DbSet<PersonalFolder> PersonalFolders { get; set; } = null!;
        public virtual DbSet<PhysicalCondition> PhysicalConditions { get; set; } = null!;
        public virtual DbSet<Status> Statuses { get; set; } = null!;
        public virtual DbSet<WorkExperience> WorkExperiences { get; set; } = null!;
        public virtual DbSet<WorkReference> WorkReferences { get; set; } = null!;
        public virtual DbSet<Workhour> Workhours { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySQL("server=localhost;Port=3306;database=helperSystem;user=root;password=Nem02183330156");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Activity>(entity =>
            {
                entity.HasKey(e => e.IdActivity)
                    .HasName("PRIMARY");

                entity.ToTable("activity");

                entity.HasIndex(e => e.ActivityName, "activity_name")
                    .IsUnique();

                entity.HasIndex(e => e.IdActivity, "id_activity")
                    .IsUnique();

                entity.Property(e => e.IdActivity).HasColumnName("id_activity");

                entity.Property(e => e.ActivityName)
                    .HasMaxLength(50)
                    .HasColumnName("activity_name");
            });

            modelBuilder.Entity<ActivityJob>(entity =>
            {
                entity.HasKey(e => e.IdActivityJob)
                    .HasName("PRIMARY");

                entity.ToTable("activity_job");

                entity.HasIndex(e => e.FkIdActivity, "FK_id_activity");

                entity.HasIndex(e => e.FkIdJob, "FK_id_job");

                entity.HasIndex(e => e.IdActivityJob, "id_activity_job")
                    .IsUnique();

                entity.Property(e => e.IdActivityJob).HasColumnName("id_activity_job");

                entity.Property(e => e.FkIdActivity).HasColumnName("FK_id_activity");

                entity.Property(e => e.FkIdJob).HasColumnName("FK_id_job");

                entity.HasOne(d => d.FkIdActivityNavigation)
                    .WithMany(p => p.ActivityJobs)
                    .HasForeignKey(d => d.FkIdActivity)
                    .HasConstraintName("activity_job_ibfk_1");

                entity.HasOne(d => d.FkIdJobNavigation)
                    .WithMany(p => p.ActivityJobs)
                    .HasForeignKey(d => d.FkIdJob)
                    .HasConstraintName("activity_job_ibfk_2");
            });

            modelBuilder.Entity<ActivityRequested>(entity =>
            {
                entity.HasKey(e => e.IdActivityRequested)
                    .HasName("PRIMARY");

                entity.ToTable("activity_requested");

                entity.HasIndex(e => e.FkIdActivity, "FK_id_activity");

                entity.HasIndex(e => e.FkIdJobOffer, "FK_id_job_offer");

                entity.HasIndex(e => e.IdActivityRequested, "id_activity_requested")
                    .IsUnique();

                entity.Property(e => e.IdActivityRequested).HasColumnName("id_activity_requested");

                entity.Property(e => e.FkIdActivity).HasColumnName("FK_id_activity");

                entity.Property(e => e.FkIdJobOffer).HasColumnName("FK_id_job_offer");

                entity.HasOne(d => d.FkIdActivityNavigation)
                    .WithMany(p => p.ActivityRequesteds)
                    .HasForeignKey(d => d.FkIdActivity)
                    .HasConstraintName("activity_requested_ibfk_2");

                entity.HasOne(d => d.FkIdJobOfferNavigation)
                    .WithMany(p => p.ActivityRequesteds)
                    .HasForeignKey(d => d.FkIdJobOffer)
                    .HasConstraintName("activity_requested_ibfk_1");
            });

            modelBuilder.Entity<Allergie>(entity =>
            {
                entity.HasKey(e => e.IdAlergie)
                    .HasName("PRIMARY");

                entity.ToTable("allergie");

                entity.HasIndex(e => e.AlergieName, "alergie_name")
                    .IsUnique();

                entity.HasIndex(e => e.IdAlergie, "id_alergie")
                    .IsUnique();

                entity.Property(e => e.IdAlergie).HasColumnName("id_alergie");

                entity.Property(e => e.AlergieName)
                    .HasMaxLength(100)
                    .HasColumnName("alergie_name");
            });

            modelBuilder.Entity<Applicant>(entity =>
            {
                entity.HasKey(e => e.IdApplicant)
                    .HasName("PRIMARY");

                entity.ToTable("applicant");

                entity.HasIndex(e => e.FkEducationLevel, "FK_education_level");

                entity.HasIndex(e => e.FkIdGender, "FK_id_gender");

                entity.HasIndex(e => e.FkIdMaritalStatus, "FK_id_marital_status");

                entity.HasIndex(e => e.IdApplicant, "id_applicant")
                    .IsUnique();

                entity.HasIndex(e => e.FkIdJobStatus, "job_status");

                entity.Property(e => e.IdApplicant).HasColumnName("id_applicant");

                entity.Property(e => e.Aboutme)
                    .HasMaxLength(600)
                    .HasColumnName("aboutme");

                entity.Property(e => e.AdminObservation)
                    .HasMaxLength(300)
                    .HasColumnName("admin_observation");

                entity.Property(e => e.Age)
                    .HasMaxLength(2)
                    .HasColumnName("age");

                entity.Property(e => e.Birthdate)
                    .HasColumnType("date")
                    .HasColumnName("birthdate");

                entity.Property(e => e.BodyPiercing).HasColumnName("body_piercing");

                entity.Property(e => e.Children)
                    .HasMaxLength(30)
                    .HasColumnName("children");

                entity.Property(e => e.City)
                    .HasMaxLength(80)
                    .HasColumnName("city");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.FkEducationLevel).HasColumnName("FK_education_level");

                entity.Property(e => e.FkIdGender).HasColumnName("FK_id_gender");

                entity.Property(e => e.FkIdJobStatus).HasColumnName("FK_id_job_status");

                entity.Property(e => e.FkIdMaritalStatus).HasColumnName("FK_id_marital_status");

                entity.Property(e => e.Fullname)
                    .HasMaxLength(300)
                    .HasColumnName("fullname");

                entity.Property(e => e.HeightCm)
                    .HasMaxLength(3)
                    .HasColumnName("height_cm");

                entity.Property(e => e.Locality)
                    .HasMaxLength(200)
                    .HasColumnName("locality");

                entity.Property(e => e.Neighborhood)
                    .HasMaxLength(70)
                    .HasColumnName("neighborhood");

                entity.Property(e => e.Phonenumber1)
                    .HasMaxLength(15)
                    .HasColumnName("phonenumber_1");

                entity.Property(e => e.Phonenumber2)
                    .HasMaxLength(15)
                    .HasColumnName("phonenumber_2");

                entity.Property(e => e.State)
                    .HasMaxLength(60)
                    .HasColumnName("state");

                entity.Property(e => e.Street)
                    .HasMaxLength(50)
                    .HasColumnName("street");

                entity.Property(e => e.Tattoos).HasColumnName("tattoos");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.WeightKg)
                    .HasMaxLength(3)
                    .HasColumnName("weight_kg");

                entity.Property(e => e.ZipCode)
                    .HasMaxLength(5)
                    .HasColumnName("zip_code");

                entity.HasOne(d => d.FkEducationLevelNavigation)
                    .WithMany(p => p.Applicants)
                    .HasForeignKey(d => d.FkEducationLevel)
                    .HasConstraintName("applicant_ibfk_3");

                entity.HasOne(d => d.FkIdGenderNavigation)
                    .WithMany(p => p.Applicants)
                    .HasForeignKey(d => d.FkIdGender)
                    .HasConstraintName("applicant_ibfk_4");

                entity.HasOne(d => d.FkIdJobStatusNavigation)
                    .WithMany(p => p.Applicants)
                    .HasForeignKey(d => d.FkIdJobStatus)
                    .HasConstraintName("applicant_ibfk_1");

                entity.HasOne(d => d.FkIdMaritalStatusNavigation)
                    .WithMany(p => p.Applicants)
                    .HasForeignKey(d => d.FkIdMaritalStatus)
                    .HasConstraintName("applicant_ibfk_2");
            });

            modelBuilder.Entity<ApplicantActivity>(entity =>
            {
                entity.HasKey(e => e.IdApplicantActivity)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_activity");

                entity.HasIndex(e => e.FkIdActivity, "FK_id_activity");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.IdApplicantActivity, "id_applicant_activity")
                    .IsUnique();

                entity.Property(e => e.IdApplicantActivity).HasColumnName("id_applicant_activity");

                entity.Property(e => e.ActivityPreference).HasColumnName("activity_preference");

                entity.Property(e => e.FkIdActivity).HasColumnName("FK_id_activity");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.HasOne(d => d.FkIdActivityNavigation)
                    .WithMany(p => p.ApplicantActivities)
                    .HasForeignKey(d => d.FkIdActivity)
                    .HasConstraintName("applicant_activity_ibfk_2");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantActivities)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_activity_ibfk_1");
            });

            modelBuilder.Entity<ApplicantAllergie>(entity =>
            {
                entity.HasKey(e => e.IdApplicantAllergie)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_allergie");

                entity.HasIndex(e => e.IdApplicantAllergie, "id_applicant_allergie")
                    .IsUnique();

                entity.Property(e => e.IdApplicantAllergie).HasColumnName("id_applicant_allergie");

                entity.Property(e => e.FkIdAllergie).HasColumnName("FK_id_allergie");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");
            });

            modelBuilder.Entity<ApplicantCondition>(entity =>
            {
                entity.HasKey(e => e.IdApplicantCondition)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_condition");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdPhysicalCondition, "FK_id_condition");

                entity.HasIndex(e => e.IdApplicantCondition, "id_applicant_condition")
                    .IsUnique();

                entity.Property(e => e.IdApplicantCondition).HasColumnName("id_applicant_condition");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdPhysicalCondition).HasColumnName("FK_id_physical_condition");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantConditions)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_condition_ibfk_1");

                entity.HasOne(d => d.FkIdPhysicalConditionNavigation)
                    .WithMany(p => p.ApplicantConditions)
                    .HasForeignKey(d => d.FkIdPhysicalCondition)
                    .HasConstraintName("applicant_condition_ibfk_2");
            });

            modelBuilder.Entity<ApplicantDesiredJob>(entity =>
            {
                entity.HasKey(e => e.IdApplicantDesiredJob)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_desired_job");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdJob, "FK_id_job");

                entity.HasIndex(e => e.IdApplicantDesiredJob, "id_applicant_desired_job")
                    .IsUnique();

                entity.Property(e => e.IdApplicantDesiredJob).HasColumnName("id_applicant_desired_job");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdJob).HasColumnName("FK_id_job");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantDesiredJobs)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_desired_job_ibfk_1");

                entity.HasOne(d => d.FkIdJobNavigation)
                    .WithMany(p => p.ApplicantDesiredJobs)
                    .HasForeignKey(d => d.FkIdJob)
                    .HasConstraintName("applicant_desired_job_ibfk_2");
            });

            modelBuilder.Entity<ApplicantDisability>(entity =>
            {
                entity.HasKey(e => e.IdApplicantDisability)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_disability");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdDisability, "FK_id_disability");

                entity.HasIndex(e => e.IdApplicantDisability, "id_applicant_disability")
                    .IsUnique();

                entity.Property(e => e.IdApplicantDisability).HasColumnName("id_applicant_disability");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdDisability).HasColumnName("FK_id_disability");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantDisabilities)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_disability_ibfk_1");

                entity.HasOne(d => d.FkIdDisabilityNavigation)
                    .WithMany(p => p.ApplicantDisabilities)
                    .HasForeignKey(d => d.FkIdDisability)
                    .HasConstraintName("applicant_disability_ibfk_2");
            });

            modelBuilder.Entity<ApplicantLanguage>(entity =>
            {
                entity.HasKey(e => e.IdApplicantLanguage)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_language");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdLanguage, "FK_id_language");

                entity.HasIndex(e => e.IdApplicantLanguage, "id_applicant_language")
                    .IsUnique();

                entity.Property(e => e.IdApplicantLanguage).HasColumnName("id_applicant_language");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdLanguage).HasColumnName("FK_id_language");

                entity.Property(e => e.LanguageLevel).HasColumnName("language_level");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantLanguages)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_language_ibfk_1");

                entity.HasOne(d => d.FkIdLanguageNavigation)
                    .WithMany(p => p.ApplicantLanguages)
                    .HasForeignKey(d => d.FkIdLanguage)
                    .HasConstraintName("applicant_language_ibfk_2");
            });

            modelBuilder.Entity<ApplicantWorkhour>(entity =>
            {
                entity.HasKey(e => e.IdApplicantWorkhour)
                    .HasName("PRIMARY");

                entity.ToTable("applicant_workhour");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdWorkhour, "FK_id_workhour");

                entity.HasIndex(e => e.IdApplicantWorkhour, "id_applicant_workhour")
                    .IsUnique();

                entity.Property(e => e.IdApplicantWorkhour).HasColumnName("id_applicant_workhour");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdWorkhour).HasColumnName("FK_id_workhour");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.ApplicantWorkhours)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("applicant_workhour_ibfk_1");

                entity.HasOne(d => d.FkIdWorkhourNavigation)
                    .WithMany(p => p.ApplicantWorkhours)
                    .HasForeignKey(d => d.FkIdWorkhour)
                    .HasConstraintName("applicant_workhour_ibfk_2");
            });

            modelBuilder.Entity<Benefit>(entity =>
            {
                entity.HasKey(e => e.IdBenefit)
                    .HasName("PRIMARY");

                entity.ToTable("benefit");

                entity.HasIndex(e => e.Benefit1, "benefit")
                    .IsUnique();

                entity.HasIndex(e => e.IdBenefit, "id_benefit")
                    .IsUnique();

                entity.Property(e => e.IdBenefit).HasColumnName("id_benefit");

                entity.Property(e => e.Benefit1)
                    .HasMaxLength(30)
                    .HasColumnName("benefit");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => e.IdCustomer)
                    .HasName("PRIMARY");

                entity.ToTable("customer");

                entity.HasIndex(e => e.IdCustomer, "id_customer")
                    .IsUnique();

                entity.Property(e => e.IdCustomer).HasColumnName("id_customer");

                entity.Property(e => e.Age)
                    .HasMaxLength(2)
                    .HasColumnName("age");

                entity.Property(e => e.BirthDate)
                    .HasColumnType("date")
                    .HasColumnName("birth_date");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.Fullname)
                    .HasMaxLength(300)
                    .HasColumnName("fullname");

                entity.Property(e => e.HaveMoreWorkers).HasColumnName("have_more_workers");

                entity.Property(e => e.Occupation)
                    .HasMaxLength(30)
                    .HasColumnName("occupation");

                entity.Property(e => e.Phonenumber1)
                    .HasMaxLength(15)
                    .HasColumnName("phonenumber_1");

                entity.Property(e => e.Phonenumber2)
                    .HasMaxLength(15)
                    .HasColumnName("phonenumber_2");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");
            });

            modelBuilder.Entity<Disability>(entity =>
            {
                entity.HasKey(e => e.IdDisability)
                    .HasName("PRIMARY");

                entity.ToTable("disability");

                entity.HasIndex(e => e.DisabilityName, "disability_name")
                    .IsUnique();

                entity.HasIndex(e => e.IdDisability, "id_disability")
                    .IsUnique();

                entity.Property(e => e.IdDisability).HasColumnName("id_disability");

                entity.Property(e => e.DisabilityName)
                    .HasMaxLength(30)
                    .HasColumnName("disability_name");
            });

            modelBuilder.Entity<DocumentFolder>(entity =>
            {
                entity.HasKey(e => e.IdDocumentFolder)
                    .HasName("PRIMARY");

                entity.ToTable("document_folder");

                entity.HasIndex(e => e.FkIdDocumentType, "FK_id_document_type");

                entity.HasIndex(e => e.FkIdPersonalFolder, "FK_id_folder");

                entity.HasIndex(e => e.IdDocumentFolder, "id_folder_document")
                    .IsUnique();

                entity.Property(e => e.IdDocumentFolder).HasColumnName("id_document_folder");

                entity.Property(e => e.FkIdDocumentType).HasColumnName("FK_id_document_type");

                entity.Property(e => e.FkIdPersonalFolder).HasColumnName("FK_id_personal_folder");

                entity.Property(e => e.FolderUrl)
                    .HasMaxLength(300)
                    .HasColumnName("folder_url");

                entity.Property(e => e.IdFolderGenerated)
                    .HasMaxLength(50)
                    .HasColumnName("id_folder_generated");

                entity.HasOne(d => d.FkIdDocumentTypeNavigation)
                    .WithMany(p => p.DocumentFolders)
                    .HasForeignKey(d => d.FkIdDocumentType)
                    .HasConstraintName("document_folder_ibfk_2");

                entity.HasOne(d => d.FkIdPersonalFolderNavigation)
                    .WithMany(p => p.DocumentFolders)
                    .HasForeignKey(d => d.FkIdPersonalFolder)
                    .HasConstraintName("document_folder_ibfk_1");
            });

            modelBuilder.Entity<DocumentJob>(entity =>
            {
                entity.HasKey(e => e.IdDocumentJob)
                    .HasName("PRIMARY");

                entity.ToTable("document_job");

                entity.HasIndex(e => e.FkIdDocumentType, "FK_id_document");

                entity.HasIndex(e => e.FkIdJob, "Fk_id_job");

                entity.HasIndex(e => e.IdDocumentJob, "id_document_job")
                    .IsUnique();

                entity.Property(e => e.IdDocumentJob).HasColumnName("id_document_job");

                entity.Property(e => e.FkIdDocumentType).HasColumnName("FK_id_document_type");

                entity.Property(e => e.FkIdJob).HasColumnName("Fk_id_job");

                entity.HasOne(d => d.FkIdDocumentTypeNavigation)
                    .WithMany(p => p.DocumentJobs)
                    .HasForeignKey(d => d.FkIdDocumentType)
                    .HasConstraintName("document_job_ibfk_2");

                entity.HasOne(d => d.FkIdJobNavigation)
                    .WithMany(p => p.DocumentJobs)
                    .HasForeignKey(d => d.FkIdJob)
                    .HasConstraintName("document_job_ibfk_1");
            });

            modelBuilder.Entity<DocumentType>(entity =>
            {
                entity.HasKey(e => e.IdDocumentType)
                    .HasName("PRIMARY");

                entity.ToTable("document_type");

                entity.HasIndex(e => e.DocumentName, "document_name")
                    .IsUnique();

                entity.HasIndex(e => e.IdDocumentType, "id_document")
                    .IsUnique();

                entity.Property(e => e.IdDocumentType).HasColumnName("id_document_type");

                entity.Property(e => e.DocumentName)
                    .HasMaxLength(60)
                    .HasColumnName("document_name");
            });

            modelBuilder.Entity<Education>(entity =>
            {
                entity.HasKey(e => e.IdEducation)
                    .HasName("PRIMARY");

                entity.ToTable("education");

                entity.HasIndex(e => e.EducationLevel, "education_level")
                    .IsUnique();

                entity.HasIndex(e => e.IdEducation, "id_education")
                    .IsUnique();

                entity.Property(e => e.IdEducation).HasColumnName("id_education");

                entity.Property(e => e.EducationLevel)
                    .HasMaxLength(30)
                    .HasColumnName("education_level");
            });

            modelBuilder.Entity<File>(entity =>
            {
                entity.HasKey(e => e.IdFile)
                    .HasName("PRIMARY");

                entity.ToTable("file");

                entity.HasIndex(e => e.FkIdFolderDocument, "FK_id_Folder");

                entity.HasIndex(e => e.FileUrl, "file_url")
                    .IsUnique();

                entity.HasIndex(e => e.IdFile, "id_file")
                    .IsUnique();

                entity.Property(e => e.IdFile).HasColumnName("id_file");

                entity.Property(e => e.FileName)
                    .HasMaxLength(50)
                    .HasColumnName("file_name");

                entity.Property(e => e.FileUrl)
                    .HasMaxLength(300)
                    .HasColumnName("file_url");

                entity.Property(e => e.FkIdFolderDocument).HasColumnName("FK_id_folder_document");

                entity.Property(e => e.IdFileGenerated)
                    .HasMaxLength(50)
                    .HasColumnName("id_file_generated");

                entity.HasOne(d => d.FkIdFolderDocumentNavigation)
                    .WithMany(p => p.Files)
                    .HasForeignKey(d => d.FkIdFolderDocument)
                    .HasConstraintName("file_ibfk_1");
            });

            modelBuilder.Entity<Gender>(entity =>
            {
                entity.HasKey(e => e.IdGender)
                    .HasName("PRIMARY");

                entity.ToTable("gender");

                entity.HasIndex(e => e.GenderName, "gender_name")
                    .IsUnique();

                entity.HasIndex(e => e.IdGender, "id_gender")
                    .IsUnique();

                entity.Property(e => e.IdGender).HasColumnName("id_gender");

                entity.Property(e => e.GenderName)
                    .HasMaxLength(50)
                    .HasColumnName("gender_name");
            });

            modelBuilder.Entity<Job>(entity =>
            {
                entity.HasKey(e => e.IdJob)
                    .HasName("PRIMARY");

                entity.ToTable("job");

                entity.HasIndex(e => e.IdJob, "id_job")
                    .IsUnique();

                entity.HasIndex(e => e.JobName, "job_name")
                    .IsUnique();

                entity.Property(e => e.IdJob).HasColumnName("id_job");

                entity.Property(e => e.JobName)
                    .HasMaxLength(100)
                    .HasColumnName("job_name");
            });

            modelBuilder.Entity<JobExtraInfo>(entity =>
            {
                entity.HasKey(e => e.IdJobExtraInfo)
                    .HasName("PRIMARY");

                entity.ToTable("job_extra_info");

                entity.HasIndex(e => e.ExtraInfo, "extra_info")
                    .IsUnique();

                entity.HasIndex(e => e.IdJobExtraInfo, "id_job_extra_info")
                    .IsUnique();

                entity.Property(e => e.IdJobExtraInfo).HasColumnName("id_job_extra_info");

                entity.Property(e => e.ExtraInfo)
                    .HasMaxLength(50)
                    .HasColumnName("extra_info");
            });

            modelBuilder.Entity<JobOffer>(entity =>
            {
                entity.HasKey(e => e.IdJobOffer)
                    .HasName("PRIMARY");

                entity.ToTable("job_offer");

                entity.HasIndex(e => e.FkIdCustomner, "FK_id_customner");

                entity.HasIndex(e => e.IdJobOffer, "id_job_offer")
                    .IsUnique();

                entity.Property(e => e.IdJobOffer).HasColumnName("id_job_offer");

                entity.Property(e => e.ApplicantDisability).HasColumnName("applicant_disability");

                entity.Property(e => e.ApplicantExperience).HasColumnName("applicant_experience");

                entity.Property(e => e.ApplicantTattoosPiercings).HasColumnName("applicant_tattoos_piercings");

                entity.Property(e => e.ApplicantsForHiring).HasColumnName("applicants_for_hiring");

                entity.Property(e => e.City)
                    .HasMaxLength(60)
                    .HasColumnName("city");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.Description)
                    .HasMaxLength(3000)
                    .HasColumnName("description");

                entity.Property(e => e.FkIdCustomner).HasColumnName("FK_id_customner");

                entity.Property(e => e.Locality)
                    .HasMaxLength(200)
                    .HasColumnName("locality");

                entity.Property(e => e.Salary)
                    .HasPrecision(10)
                    .HasColumnName("salary");

                entity.Property(e => e.StartDate)
                    .HasColumnType("date")
                    .HasColumnName("start_date");

                entity.Property(e => e.State)
                    .HasMaxLength(60)
                    .HasColumnName("state");

                entity.Property(e => e.Street)
                    .HasMaxLength(50)
                    .HasColumnName("street");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.WorkPlace)
                    .HasMaxLength(60)
                    .HasColumnName("work_place");

                entity.Property(e => e.ZipCode)
                    .HasMaxLength(5)
                    .HasColumnName("zip_code");

                entity.HasOne(d => d.FkIdCustomnerNavigation)
                    .WithMany(p => p.JobOffers)
                    .HasForeignKey(d => d.FkIdCustomner)
                    .HasConstraintName("job_offer_ibfk_1");
            });

            modelBuilder.Entity<JobOfferBenefit>(entity =>
            {
                entity.HasKey(e => e.IdJobOfferBenefit)
                    .HasName("PRIMARY");

                entity.ToTable("job_offer_benefit");

                entity.HasIndex(e => e.FkIdBenefit, "FK_id_benefit");

                entity.HasIndex(e => e.FkIdJobOffer, "FK_id_job_offer");

                entity.HasIndex(e => e.IdJobOfferBenefit, "id_offer_benefit")
                    .IsUnique();

                entity.Property(e => e.IdJobOfferBenefit).HasColumnName("id_job_offer_benefit");

                entity.Property(e => e.FkIdBenefit).HasColumnName("FK_id_benefit");

                entity.Property(e => e.FkIdJobOffer).HasColumnName("FK_id_job_offer");

                entity.HasOne(d => d.FkIdBenefitNavigation)
                    .WithMany(p => p.JobOfferBenefits)
                    .HasForeignKey(d => d.FkIdBenefit)
                    .HasConstraintName("job_offer_benefit_ibfk_2");

                entity.HasOne(d => d.FkIdJobOfferNavigation)
                    .WithMany(p => p.JobOfferBenefits)
                    .HasForeignKey(d => d.FkIdJobOffer)
                    .HasConstraintName("job_offer_benefit_ibfk_1");
            });

            modelBuilder.Entity<JobOfferExtraInfo>(entity =>
            {
                entity.HasKey(e => e.IdJobOfferExtraInfo)
                    .HasName("PRIMARY");

                entity.ToTable("job_offer_extra_info");

                entity.HasIndex(e => e.FkIdJobExtraInfo, "FK_id_job_extra_info");

                entity.HasIndex(e => e.FkIdJobOffer, "FK_id_job_offer");

                entity.HasIndex(e => e.IdJobOfferExtraInfo, "id_job_offer_extra_info")
                    .IsUnique();

                entity.Property(e => e.IdJobOfferExtraInfo).HasColumnName("id_job_offer_extra_info");

                entity.Property(e => e.FkIdJobExtraInfo).HasColumnName("FK_id_job_extra_info");

                entity.Property(e => e.FkIdJobOffer).HasColumnName("FK_id_job_offer");

                entity.HasOne(d => d.FkIdJobExtraInfoNavigation)
                    .WithMany(p => p.JobOfferExtraInfos)
                    .HasForeignKey(d => d.FkIdJobExtraInfo)
                    .HasConstraintName("job_offer_extra_info_ibfk_2");

                entity.HasOne(d => d.FkIdJobOfferNavigation)
                    .WithMany(p => p.JobOfferExtraInfos)
                    .HasForeignKey(d => d.FkIdJobOffer)
                    .HasConstraintName("job_offer_extra_info_ibfk_1");
            });

            modelBuilder.Entity<JobOfferWorkhour>(entity =>
            {
                entity.HasKey(e => e.IdJobOfferWorkhour)
                    .HasName("PRIMARY");

                entity.ToTable("job_offer_workhour");

                entity.HasIndex(e => e.FkIdJobOffer, "FK_id_job_offer");

                entity.HasIndex(e => e.FkIdWorkhour, "FK_id_work_hour");

                entity.HasIndex(e => e.IdJobOfferWorkhour, "id_job_offer_work_hour")
                    .IsUnique();

                entity.Property(e => e.IdJobOfferWorkhour).HasColumnName("id_job_offer_workhour");

                entity.Property(e => e.FkIdJobOffer).HasColumnName("FK_id_job_offer");

                entity.Property(e => e.FkIdWorkhour).HasColumnName("FK_id_workhour");

                entity.HasOne(d => d.FkIdJobOfferNavigation)
                    .WithMany(p => p.JobOfferWorkhours)
                    .HasForeignKey(d => d.FkIdJobOffer)
                    .HasConstraintName("job_offer_workhour_ibfk_1");

                entity.HasOne(d => d.FkIdWorkhourNavigation)
                    .WithMany(p => p.JobOfferWorkhours)
                    .HasForeignKey(d => d.FkIdWorkhour)
                    .HasConstraintName("job_offer_workhour_ibfk_2");
            });

            modelBuilder.Entity<Language>(entity =>
            {
                entity.HasKey(e => e.IdLanguage)
                    .HasName("PRIMARY");

                entity.ToTable("language");

                entity.HasIndex(e => e.IdLanguage, "id_language")
                    .IsUnique();

                entity.HasIndex(e => e.Language1, "language")
                    .IsUnique();

                entity.Property(e => e.IdLanguage).HasColumnName("id_language");

                entity.Property(e => e.Language1)
                    .HasMaxLength(20)
                    .HasColumnName("language");
            });

            modelBuilder.Entity<MaritalStatus>(entity =>
            {
                entity.HasKey(e => e.IdMaritalStatus)
                    .HasName("PRIMARY");

                entity.ToTable("marital_status");

                entity.HasIndex(e => e.IdMaritalStatus, "id_marital_status")
                    .IsUnique();

                entity.HasIndex(e => e.MaritalStatusName, "marital_status_name")
                    .IsUnique();

                entity.Property(e => e.IdMaritalStatus).HasColumnName("id_marital_status");

                entity.Property(e => e.MaritalStatusName)
                    .HasMaxLength(30)
                    .HasColumnName("marital_status_name");
            });

            modelBuilder.Entity<PersonalFolder>(entity =>
            {
                entity.HasKey(e => e.IdPersonalFolder)
                    .HasName("PRIMARY");

                entity.ToTable("personal_folder");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FolderName, "folder_name")
                    .IsUnique();

                entity.HasIndex(e => e.FolderUrl, "folder_url")
                    .IsUnique();

                entity.HasIndex(e => e.IdPersonalFolder, "id_folder")
                    .IsUnique();

                entity.Property(e => e.IdPersonalFolder).HasColumnName("id_personal_folder");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FolderName)
                    .HasMaxLength(60)
                    .HasColumnName("folder_name");

                entity.Property(e => e.FolderUrl)
                    .HasMaxLength(300)
                    .HasColumnName("folder_url");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.PersonalFolders)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("personal_folder_ibfk_1");
            });

            modelBuilder.Entity<PhysicalCondition>(entity =>
            {
                entity.HasKey(e => e.IdPhysicalCondition)
                    .HasName("PRIMARY");

                entity.ToTable("physical_condition");

                entity.HasIndex(e => e.PhysicalActivity, "condition")
                    .IsUnique();

                entity.HasIndex(e => e.IdPhysicalCondition, "id_condition")
                    .IsUnique();

                entity.Property(e => e.IdPhysicalCondition).HasColumnName("id_physical_condition");

                entity.Property(e => e.PhysicalActivity)
                    .HasMaxLength(100)
                    .HasColumnName("physical_activity");

                entity.Property(e => e.Rating)
                    .HasMaxLength(10)
                    .HasColumnName("rating");
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.HasKey(e => e.IdStatus)
                    .HasName("PRIMARY");

                entity.ToTable("status");

                entity.HasIndex(e => e.IdStatus, "id_status")
                    .IsUnique();

                entity.HasIndex(e => e.StatusName, "status")
                    .IsUnique();

                entity.Property(e => e.IdStatus).HasColumnName("id_status");

                entity.Property(e => e.StatusName)
                    .HasMaxLength(30)
                    .HasColumnName("status_name");
            });

            modelBuilder.Entity<WorkExperience>(entity =>
            {
                entity.HasKey(e => e.IdWorkExperience)
                    .HasName("PRIMARY");

                entity.ToTable("work_experience");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.IdWorkExperience, "id_work_experience")
                    .IsUnique();

                entity.Property(e => e.IdWorkExperience).HasColumnName("id_work_experience");

                entity.Property(e => e.Activities)
                    .HasMaxLength(1000)
                    .HasColumnName("activities");

                entity.Property(e => e.EndDate)
                    .HasColumnType("date")
                    .HasColumnName("end_date");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.JobName)
                    .HasMaxLength(60)
                    .HasColumnName("job_name");

                entity.Property(e => e.LeavingReason)
                    .HasMaxLength(300)
                    .HasColumnName("leaving_reason");

                entity.Property(e => e.StartDate)
                    .HasColumnType("date")
                    .HasColumnName("start_date");

                entity.Property(e => e.WorkPlace)
                    .HasMaxLength(60)
                    .HasColumnName("work_place");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.WorkExperiences)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("work_experience_ibfk_1");
            });

            modelBuilder.Entity<WorkReference>(entity =>
            {
                entity.HasKey(e => e.IdWorkReference)
                    .HasName("PRIMARY");

                entity.ToTable("work_reference");

                entity.HasIndex(e => e.FkIdApplicant, "FK_id_applicant");

                entity.HasIndex(e => e.FkIdWorkExperience, "FK_id_work_experience");

                entity.HasIndex(e => e.IdWorkReference, "id_work_reference")
                    .IsUnique();

                entity.Property(e => e.IdWorkReference).HasColumnName("id_work_reference");

                entity.Property(e => e.ContactNumber)
                    .HasMaxLength(15)
                    .HasColumnName("contact_number");

                entity.Property(e => e.FkIdApplicant).HasColumnName("FK_id_applicant");

                entity.Property(e => e.FkIdWorkExperience).HasColumnName("FK_id_work_experience");

                entity.Property(e => e.ReferenceJobPosition)
                    .HasMaxLength(60)
                    .HasColumnName("reference_job_position");

                entity.Property(e => e.ReferenceName)
                    .HasMaxLength(60)
                    .HasColumnName("reference_name");

                entity.Property(e => e.WorkReferenceComment)
                    .HasMaxLength(200)
                    .HasColumnName("work_reference_comment");

                entity.HasOne(d => d.FkIdApplicantNavigation)
                    .WithMany(p => p.WorkReferences)
                    .HasForeignKey(d => d.FkIdApplicant)
                    .HasConstraintName("work_reference_ibfk_2");

                entity.HasOne(d => d.FkIdWorkExperienceNavigation)
                    .WithMany(p => p.WorkReferences)
                    .HasForeignKey(d => d.FkIdWorkExperience)
                    .HasConstraintName("work_reference_ibfk_1");
            });

            modelBuilder.Entity<Workhour>(entity =>
            {
                entity.HasKey(e => e.IdWorkhour)
                    .HasName("PRIMARY");

                entity.ToTable("workhour");

                entity.HasIndex(e => e.IdWorkhour, "id_workhour")
                    .IsUnique();

                entity.HasIndex(e => e.Mode, "mode")
                    .IsUnique();

                entity.Property(e => e.IdWorkhour).HasColumnName("id_workhour");

                entity.Property(e => e.Description)
                    .HasMaxLength(300)
                    .HasColumnName("description");

                entity.Property(e => e.Mode)
                    .HasMaxLength(50)
                    .HasColumnName("mode");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

// See https://aka.ms/new-console-template for more information
using Microsoft.EntityFrameworkCore;
using migrationdatabase.Models;


fileCDMXDomestica domesticaCDMX = new fileCDMXDomestica();
fileTampicoDomestica domesticaTampico = new fileTampicoDomestica();
FilePersonalDocente filePersonalDocente = new FilePersonalDocente();
FilePersonalAdministrativo filePersonalAdministrativo = new FilePersonalAdministrativo();
FilePersonalEnfermera filePersonalEnfermera = new FilePersonalEnfermera();
FilePersonalGeneral filePersonalGeneral = new FilePersonalGeneral();
FilePersonalChofer filePersonalChofer = new FilePersonalChofer();

Console.WriteLine("/*/*/*/*/*/*/*/*/*/*/*/*/*/Program.cs*/*/*/*/*/*/*/*/*/*/**/*/*/*");


// domesticaCDMX.readCSVWithTool();
// Console.WriteLine("CDMX Domestica guardado");

domesticaTampico.readCSVWithTool();
Console.WriteLine("Tampico Domestica guardado");

// filePersonalDocente.readFile();
// Console.WriteLine("Personal docente guardado");

// filePersonalAdministrativo.readFile();
// Console.WriteLine("Personal Administrativo guardado");

// filePersonalEnfermera.readFile();

//--------------------------
// filePersonalGeneral.readFile();
// filePersonalChofer.readFile();

helperSystemContext context = new helperSystemContext();
ApplicantDesiredJob desiredJob = new ApplicantDesiredJob();


// desiredJob = context.ApplicantDesiredJobs.Include(desiredJob => desiredJob.FkIdApplicantNavigation).
// Include(desiredJob => desiredJob.FkIdJobNavigation).
// First(desiredJob => desiredJob.FkIdJob == 1);

// Console.WriteLine("Applicant navigation => "+desiredJob.FkIdApplicantNavigation.Fullname + " || Job navigation => "+ desiredJob.FkIdJobNavigation.JobName);
Console.WriteLine();
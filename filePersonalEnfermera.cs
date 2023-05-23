using migrationdatabase.Models;
using Microsoft.EntityFrameworkCore;
using MySql.Data;
using OfficeOpenXml;
using System.ComponentModel;
using System.Globalization;

public class FilePersonalEnfermera
{
    helperSystemContext context = new helperSystemContext();
    public void readFile()
    {
        Console.WriteLine("El context esta configurado para " + context.ChangeTracker.QueryTrackingBehavior);
        string filePath = "./Files/PERSONAL.xlsx";
        FileInfo file = new FileInfo(filePath);
        ExcelPackage package = new ExcelPackage(file);
        ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
        ExcelWorksheet worksheet = package.Workbook.Worksheets[5];

        // int rows = worksheet.Dimension.Rows;
        // int columns = worksheet.Dimension.Columns;
        int rows = 8;
        int columns = 14;
        Console.WriteLine("Rows = " + rows + "   Columns = " + columns + "  In sheet " + worksheet.Name);
        string[,] arreglo = new string[rows, columns];

        for (int row = 1; row <= rows; row++)
        {
            for (int col = 1; col <= columns; col++)
            {
                string cellValue = worksheet.Cells[row, col].Value == null ? " " : worksheet.Cells[row, col].Value.ToString();
                TextInfo textinfo = CultureInfo.CurrentCulture.TextInfo;
                cellValue = textinfo.ToTitleCase(cellValue.ToLower());
                arreglo[row - 1, col - 1] = cellValue;
            }
        }

        package.Dispose();
        // print(arreglo);

        storeApplicant(arreglo);
    }


    public void storeApplicant(string[,] content)
    {
        List<Applicant> applicants = new List<Applicant>();
        Applicant applicant;
        int length = 0;

        for (int i = 1; i < 8; i++)
        {
            applicant = new Applicant();
            // applicant.IdApplicant = i;
            applicant.Fullname = content[i, 0].Trim('.');
            applicant.Aboutme = content[i, 10].Trim('.');
            // Console.WriteLine(i+", "+content[i,1]);
            // Console.WriteLine(i + (content[i,1])+ " Is date? = " + isDate(content[i,1]));
            applicant.Birthdate = isDate(content[i, 1]) ? DateTime.Parse(content[i, 1]) : DateTime.Now;
            applicant.Age = isDate(content[i, 1]) ? calculateAge(applicant.Birthdate ?? DateTime.Now) : null;
            applicant.FkIdGender = 2;
            applicant.Street = null;
            applicant.Neighborhood = null;
            applicant.Locality = null;
            applicant.City = content[i, 5].Trim('.');
            applicant.State = null;
            applicant.ZipCode = null;
            applicant.Phonenumber1 = null;
            applicant.Phonenumber2 = null;
            applicant.BodyPiercing = null;
            applicant.Children = content[i, 8].Trim('.') == "No Especifica" ? null : content[i, 8].Trim('.');
            applicant.Tattoos = null;
            applicant.WeightKg = null;
            applicant.HeightCm = null;
            applicant.FkIdJobStatus = null; //PENDIENTE //esto es de la columna de colocada
            applicant.AdminObservation = content[i, 13].Trim('.');
            applicant.FkIdMaritalStatus = null; /*PENDIENTE*/
            applicant.FkEducationLevel = null; /*PENDIENTE*/
            applicant.CreatedAt = null;
            applicant.UpdatedAt = null;


            applicants.Add(applicant);

            // if (content[i, 4].Length > length)
            // {
            //     length = content[i, 4].Length;
            //     Console.WriteLine(content[i,4]);
            // }

            // Console.WriteLine("content phonenumber " + content[i,17] + "\n applicant phonenumber "+ applicant.Phonenumber1);
            // Console.WriteLine("REFERENCES =>" + content[i,12]);

            context.Applicants.Add(applicant);
            context.SaveChanges();
            storeOtherColumns(applicant, content, i);

            // break;
        }
        // Console.WriteLine(applicants.Count() + " Applicants");
        // Console.WriteLine("length city " + length + "\n");
        // print(applicants);
    }


    //Esto se hace una vez el candidato se haya guardado
    public void storeOtherColumns(Applicant? applicant, string[,] content, int i)
    {

        /********************DESIRED JOB *****************/

        ApplicantDesiredJob desiredJob = new ApplicantDesiredJob();

        if (content[i, 3].Contains("Enfermera"))
        {
            desiredJob.FkIdApplicant = applicant.IdApplicant;
            desiredJob.FkIdJob = 9;
        }

        context.ApplicantDesiredJobs.Add(desiredJob);
        context.SaveChanges();

        if (content[i, 3].Contains("Aux"))
        {
            desiredJob = new ApplicantDesiredJob();
            desiredJob.FkIdApplicant = applicant.IdApplicant;
            desiredJob.FkIdJob = 23;
            context.ApplicantDesiredJobs.Add(desiredJob);
            context.SaveChanges();

        }
       


        /***********************APPLICANT WORKHOURS********/
        ApplicantWorkhour applicantWorkhour = new ApplicantWorkhour();

        applicantWorkhour.FkIdApplicant = applicant.IdApplicant;
        applicantWorkhour.FkIdWorkhour = 1;

        context.ApplicantWorkhours.Add(applicantWorkhour);
        context.SaveChanges();



        /********************APPLICANT ACTIVITIES************************/
        // ApplicantActivity applicantActivity;
        // if (content[i, 6] == "Si")
        // {//cuidado de bebes
        //     applicantActivity = new ApplicantActivity();
        //     applicantActivity.FkIdApplicant = applicant.IdApplicant;
        //     applicantActivity.FkIdActivity = 1;

        //     context.ApplicantActivities.Add(applicantActivity);
        //     context.SaveChanges();
        // }
        // if (content[i, 6] == "Si")
        // {//cuidado de niños
        //     applicantActivity = new ApplicantActivity();
        //     applicantActivity.FkIdApplicant = applicant.IdApplicant;
        //     applicantActivity.FkIdActivity = 2;

        //     context.ApplicantActivities.Add(applicantActivity);
        //     context.SaveChanges();
        // }



        /****************MARITAL STATUS**********************/
        // Console.WriteLine("CONTENT[189] " + content[189, 12]);
        if (content[i, 7].Contains("Solter"))
        {
            applicant.FkIdMaritalStatus = 1;
        }
        else
        if (content[i, 7].Contains("Uni")) //union libre
        {
            applicant.FkIdMaritalStatus = 4;
        }
        else
        if (content[i, 7].Contains("Casad"))
        {
            applicant.FkIdMaritalStatus = 2;
        }
        else
        if (content[i, 7].Contains("Separad"))
        {
            applicant.FkIdMaritalStatus = 6;
        }
        else
        if (content[i, 7].Contains("Divorciad"))
        {
            applicant.FkIdMaritalStatus = 5;
        }
        else
        if (content[i, 7].Contains("Viud"))
        {
            applicant.FkIdMaritalStatus = 3;
        }

        context.SaveChanges();


        /******************JOB STATUS************************/
        //  1 | Colocada      
        //  2 | No colocada   
        //  3 | Vetada        
        //  4 | No disponible
        if (content[i, 13].Contains("Disponible") || content[i,13].Contains("En Espera"))
        {
            applicant.FkIdJobStatus = 2;
        }
        else if (content[i, 13].Contains("Ocup") || content[i, 12].Contains("No Disponible"))
        {
            applicant.FkIdJobStatus = 4;
        }
        else if (content[i, 13].Contains("Betada"))
        {
            applicant.FkIdJobStatus = 3;
        }
        else
        {
            applicant.FkIdJobStatus = 1;
        }

        context.SaveChanges();



        /************APPLICANT PHONENUMBER 1**************/

        if (content[i, 11].Length > 5 && content[i, 11] != null)
        {
            Console.WriteLine(i + " content[i,10]=> " + content[i, 11] + " has length = " + content[i, 11].Length);
            string phonenumber = content[i, 11].Replace(" ", "");
            phonenumber = phonenumber.Replace("-", "");
            phonenumber = phonenumber.Replace(",", "");
            phonenumber = phonenumber.Replace(".", "");
            phonenumber = phonenumber.Replace("(", "");
            phonenumber = phonenumber.Replace(")", "");

            Console.WriteLine(i + " Phonenumber => " + phonenumber + " has length = " + phonenumber.Length);
            if (phonenumber.Length <= 15)
            {
                applicant.Phonenumber1 = phonenumber;
                context.SaveChanges();
            }

        }


        /***************APPLICANT STATE***************/
        // if (content[i, 5].Contains("Tamaulipas"))
        // {
        //     applicant.State = "Tamaulipas";
        // }
        // else
        // if (content[i, 5].Contains("Veracruz"))
        // {
        //     applicant.State = "Veracruz";
        // }
        // else
        // {
        //     applicant.State = "Tamaulipas";
        // }
        // context.SaveChanges();

        /*************************APPLICANT REFERENCES*******//////
        WorkReference workReference;
        string[] references = content[i, 12].Split("/");

        foreach (var reference in references)
        {
            workReference = new WorkReference();

            string[] name_phonenumber = reference.Split("=");

            Console.WriteLine("array [0] => " + name_phonenumber[0]);
            if (name_phonenumber.Length == 1)
            { //solo existe el nombre sin telefono
                Console.WriteLine(i + " Nombre => " + name_phonenumber[0]);

                workReference.FkIdApplicant = applicant.IdApplicant;

                string[] name_jobPosition = name_phonenumber[0].Split(',');
                string[] name_comment = name_jobPosition[0].Split("-");
                if (name_comment.Length == 2)
                {
                    workReference.WorkReferenceComment = name_comment[1].Trim('.');
                }

                workReference.ReferenceName = name_jobPosition[0].Trim('.');

                if (name_jobPosition.Length == 2)//si tiene nombre y cargo
                {
                    Console.WriteLine(i + " Puesto => " + name_jobPosition[1]);
                    workReference.ReferenceJobPosition = name_jobPosition[1].Trim('.');
                }

               

            }
            else
            {
                string phonenumber = name_phonenumber[1].Replace(" ", "");
                phonenumber = phonenumber.Replace("-", "");
                phonenumber = phonenumber.Replace(",", "");
                phonenumber = phonenumber.Replace(".", "");
                phonenumber = phonenumber.Replace("(", "");
                phonenumber = phonenumber.Replace(")", "");
                Console.WriteLine(i + " Nombre => " + name_phonenumber[0] + ", Telefono => " + phonenumber);

                string[] name_jobPosition = name_phonenumber[0].Split(',');

                workReference.FkIdApplicant = applicant.IdApplicant;
                workReference.ReferenceName = name_jobPosition[0].Trim('.');
                workReference.ContactNumber = phonenumber;

                if (name_jobPosition.Length == 2)//si tiene nombre y cargo
                {
                    Console.WriteLine(i + " Puesto => " + name_jobPosition[1]);
                    workReference.ReferenceJobPosition = name_jobPosition[1].Trim('.');
                }
                string[] name_comment = reference.Split("-");
                name_comment[0] = name_jobPosition[0];
                if (name_comment.Length == 2)
                {
                    workReference.WorkReferenceComment = name_comment[1].Trim('.');
                }

            }

            context.WorkReferences.Add(workReference);
            context.SaveChanges();
        }
    }



    public bool isDate(string value)
    {
        DateTime result;
        return DateTime.TryParse(value, out result);
    }



    public string calculateAge(DateTime birthdate)
    {
        int age = DateTime.Today.Year - birthdate.Year;
        if (birthdate > DateTime.Now.AddYears(-age))
        {
            age--;
        }
        return age.ToString();
    }

    public void print(ApplicantDesiredJob applicantjob)
    {
        Console.WriteLine("Applicant desired job");
        foreach (PropertyDescriptor descriptor in TypeDescriptor.GetProperties(applicantjob))
        {
            string name = descriptor.Name;
            object value = descriptor.GetValue(applicantjob);
            Console.WriteLine("{0} = {1} ", name, value);
        }

    }
    public void print(List<Applicant> applicants)
    {
        int iteracion = 0;
        foreach (var applicant in applicants)
        {
            foreach (PropertyDescriptor descriptor in TypeDescriptor.GetProperties(applicant))
            {
                string name = descriptor.Name;
                object value = descriptor.GetValue(applicant);
                Console.WriteLine("{0} = {1} ", name, value);
            }
            Console.WriteLine("\n");
            iteracion++;
            // if (iteracion == 10) break;
        }
    }
    public void print(string[,] rowsColumns)
    {

        for (int i = 0; i < rowsColumns.GetLength(0); i++)
        {
            Console.WriteLine(string.Join(" | ", Enumerable.Range(0, rowsColumns.GetLength(1)).Select(j => rowsColumns[i, j])));
            Console.WriteLine("\n\n");
            // break;
        }
    }


}

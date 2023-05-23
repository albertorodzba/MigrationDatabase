
use helpersystem;
INSERT INTO job VALUES
(DEFAULT, "Puesto administrativo"),
(default, "Auxiliar contable"),
(DEFAULT, "Marketing"),
(DEFAULT, "Psicólogo/a"),
(DEFAULT, "Auxiliar de recursos humanos"),
(DEFAULT, "Contador"),
(DEFAULT, "Administrador de empresas"),
(DEFAULT, "Administrador de recursos humanos")
;

select * from work_reference where id_work_reference = 577;
select * from work_reference;

select fullname, id_applicant, contact_number,reference_name,work_reference_comment from applicant
LEFT JOIN work_reference ON `FK_id_applicant` = id_applicant;

select id_applicant, fullname, workhour.mode from applicant
LEFT JOIN applicant_workhour ON `FK_id_applicant` = id_applicant
LEFT JOIN workhour ON id_workhour = applicant_workhour.`FK_id_workhour`;

select id_applicant, fullname, job.job_name from applicant
LEFT JOIN applicant_desired_job ON `FK_id_applicant` = id_applicant
LEFT JOIN job ON id_job = `FK_id_job`
WHERE job.job_name LIKE '%chofe%';

select id_applicant, fullname, FK_id_marital_status from applicant;

select * from education;

update work_reference 
set contact_number = '8332060697'
where  id_work_reference = 577;


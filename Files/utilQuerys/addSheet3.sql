--TODO LO QUE ESTA EN ESTE QUERY ES INFORMACIÓN POSTERIOR AL .SQL con terminacion 1413 del 18-MAYO
INSERT INTO education VALUES (DEFAULT, "Carrera técnica");
INSERT INTO education VALUES(DEFAULT, "Maestría"), (DEFAULT, "Doctorado");
INSERT INTO language VALUES(DEFAULT, "Portugués");
select * from education;
INSERT INTO job VALUES(DEFAULT, "Docente"),(DEFAULT, "Niñera"),(DEFAULT,"Maestro/a de natación"), 
(DEFAULT, "Asistente educativo"),
(DEFAULT, "Técnico en puericultura"),
(DEFAULT, "Profesor/a de inglés"),
(DEFAULT, "Enfermera"),
(DEFAULT, "Ingeniero industrial"),
(DEFAULT, "Ingeniero químico"),
(DEFAULT, "Docente de primaria"),
(DEFAULT, "Docente de secundaria"),
(DEFAULT, "Docente de preescolar");

select * from job;
----AQUI SE INSERTO TODO ANTES DE METER LOS DATOS DE DOCENTE-NIÑERA

select FK_id_applicant, fullname, applicant_desired_job.`FK_id_job` from applicant
LEFT JOIN applicant_desired_job ON applicant.id_applicant = applicant_desired_job.id_applicant_desired_job;

select id_applicant, applicant.fullname, `FK_id_job`,  job_name, activity.activity_name ,work_reference.reference_name,work_reference.contact_number, work_reference.reference_job_position from applicant 
LEFT JOIN applicant_desired_job ON applicant.id_applicant = applicant_desired_job.`FK_id_applicant`
LEFT JOIN job ON job.id_job = applicant_desired_job.`FK_id_job`
LEFT JOIN applicant_activity ON applicant_activity.`FK_id_applicant` = id_applicant
LEFT JOIN activity on activity.id_activity = applicant_activity.`FK_id_activity`
LEFT JOIN work_reference ON work_reference.`FK_id_applicant` = applicant.id_applicant;

select * from applicant;

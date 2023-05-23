-- Active: 1684169186024@@127.0.0.1@3306@helperSystem
--CREATE VIEW applicant_full_info AS
select id_applicant, fullname,`FK_id_job_status`, id_status, status_name from applicant LEFT JOIN status ON applicant.`FK_id_job_status` = status.id_status;

SELECT phonenumber_1 FROM applicant;
SELECT * FROM applicant;
SELECT *
FROM applicant
LEFT JOIN work_experience ON applicant.id_applicant = work_experience.FK_id_applicant
LEFT JOIN work_reference ON work_reference.FK_id_work_experience = work_experience.id_work_experience;

SELECT  id_applicant, fullname, applicant_desired_job.`FK_id_job`, job_name from applicant 
LEFT JOIN applicant_desired_job ON applicant.id_applicant = applicant_desired_job.`FK_id_applicant`
INNER JOIN job ON job.id_job = applicant_desired_job.`FK_id_job` 
ORDER BY applicant.id_applicant ASC;
-- LEFT JOIN applicant_activity ON applicant.id_applicant = applicant_activity.`FK_id_applicant`;

select * from job;

select * from applicant_desired_job;

describe work_hour;

--agreagado lineas 15 - 95
INSERT INTO work_hour values
(DEFAULT, "Entrada Por Salida", "Turno de 8 a 12 horas"),
(DEFAULT, "De Planta (Salida Cada 15 Días)", null),
(DEFAULT, "De planta (Salida Cada 8 Días)", null);
INSERT INTO workhour VALUES
(DEFAULT, "Ocasional", "Sin días establecidos");

INSERT INTO job VALUES (DEFAULT, "Empleado/a Doméstico/a");
INSERT INTO job VALUES (DEFAULT, "Jardínero/a");

INSERT INTO activity VALUES 
(DEFAULT, "Cuidado de bebés"),
(DEFAULT, "Cuidado de niños"),
(DEFAULT, "Cuidado de Adultos mayores"), 
(DEFAULT, "Cocina"),
(DEFAULT, "Planchado");


INSERT INTO marital_status VALUES
(DEFAULT, "Soltero/a"),
(DEFAULT, "Casado/a"),
(DEFAULT, "Viudo/a"),
(DEFAULT, "Unión libre"),
(DEFAULT, "Divorciado/a"),
(DEFAULT, "Separado/a");


INSERT INTO education VALUES
(DEFAULT, "Primaria"),
(DEFAULT, "Secundaria"),
(DEFAULT, "Preparatoria"),
(DEFAULT, "Licenciatura"),
(DEFAULT, "Universidad trunca");

INSERT INTO language VALUES
(DEFAULT, "Inglés"),
(DEFAULT, "Español"),
(DEFAULT, "Francés"),
(DEFAULT, "Italiano");

INSERT INTO allergie VALUES 
(DEFAULT, "Perros"),
(DEFAULT, "Gatos"),
(DEFAULT, "Tortugas"),
(DEFAULT, "Polen"),
(DEFAULT, "Polvo"),
(DEFAULT, "Plantas venenosas");

INSERT INTO status VALUES
(DEFAULT, "Colocada"),
(DEFAULT, "No colocada"),
(DEFAULT, "Vetada");
INSERT INTO status VALUES
(DEFAULT, "No disponible");

INSERT INTO disability VALUES
(DEFAULT, 'Visión parcial o baja visión'),
(DEFAULT, 'Amputación de brazo'),
(DEFAULT, 'Amputación de pierna'),
(DEFAULT, 'Movilidad preservada'),
(DEFAULT, 'Discapacidad auditiva'),
(DEFAULT, 'Autismo'),
(DEFAULT, 'Enfermedad crónica'),
(DEFAULT, 'Lesión medular');

INSERT INTO physical_condition VALUES
(DEFAULT, "Puedo subir escaleras", "Positivo"),
(DEFAULT, "Hago ejercicio por lo menos 2 veces a la semana", "Positivo"),
(DEFAULT, "Puedo levantar objetos pesadas", "Positivo"),
(DEFAULT, "Realizo ejercicios de flexibilidad", "Positivo"),
(DEFAULT, "Me fatigo rápido", "Negativo"),
(DEFAULT, "No hago ejercicio", "Negativo"),
(DEFAULT, "Siento rigidez al moverme", "Negativo"),
(DEFAULT, "No puedo levantar objetos pesados", "Negativo");

INSERT INTO document_type VALUES
(DEFAULT, "INE"),
(DEFAULT, "Comprobante de domicilio"),
(DEFAULT, "Licencia de conducir"),
(DEFAULT, "Carta de recomendación"),
(DEFAULT, "Carta de antecedentes penales"),
(DEFAULT, "Certificaciones"),
(DEFAULT, "Vacunación contra COVID-19"),
(DEFAULT, "Titulo Universitario");
--agregado lineas 15-95

--agregado lineas 98-106
CREATE Table `gender`(
`id_gender` int PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
`gender_name` varchar(50) UNIQUE NOT NULL
);

ALTER TABLE applicant rename COLUMN gender to `FK_id_gender`;
ALTER TABLE applicant ADD FOREIGN KEY (`FK_id_gender`) REFERENCES `gender` (`id_gender`);
ALTER TABLE applicant rename COLUMN `job_status` to `FK_id_job_status`;


INSERT INTO gender VALUES
(DEFAULT, "Masculino"),
(DEFAULT, "Femenino"),
(DEFAULT, "Transgénero"),
(DEFAULT, "No binario"),
(DEFAULT, "Otro/Prefiero no decir");
--agregado lineas 98-115

select * from status;


CREATE TABLE staging_hospital_data (
	name TEXT,
	age INT,
	gender TEXT,
	blood_type TEXT,
	medical_condition TEXT,
	admission_date DATE,
	doctor TEXT,
	hospital TEXT,
	insurance_provider TEXT,
	billing_amount NUMERIC,
	room_number INT,
	admission_type TEXT,
	discharge_date DATE,
	medication TEXT,
	test_results TEXT
);


CREATE TABLE patients (
patient_id SERIAL PRIMARY KEY,
patient_name TEXT,
age INT,
gender TEXT,
blood_type TEXT
);

CREATE TABLE admissions (
admission_id SERIAL PRIMARY KEY,
patient_id INT,
admission_date DATE,
discharge_date DATE,
admission_type TEXT,
hospital TEXT,
doctor TEXT,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE diagnoses (
diagnosis_id SERIAL PRIMARY KEY,
admission_id INT,
diagnosis_name TEXT,
medication TEXT,
test_results TEXT,
FOREIGN KEY (admission_id) REFERENCES admissions(admission_id)
);

INSERT INTO patients (patient_name, age, gender, blood_type)
SELECT DISTINCT
	name,
	age,
	gender,
	blood_type
FROM staging_hospital_data;

INSERT INTO admissions (
	patient_id,
	admission_date,
	discharge_date,
	admission_type,
	hospital,
	doctor
)
SELECT
	p.patient_id,
	s.admission_date,
	s.discharge_date,
	s.admission_type,
	s.hospital,
	s.doctor
FROM staging_hospital_data s
JOIN patients p
ON s.name = p.patient_name;
	
INSERT INTO diagnoses (
	admission_id,
	diagnosis_name,
	medication,
	test_results
)
SELECT 
	a.admission_id,
	s.medical_condition,
	s.medication,
	s.test_results
FROM staging_hospital_data s
JOIN patients p ON s.name = p.patient_name
JOIN admissions a ON p.patient_id = a.patient_id
AND s.admission_date = a.admission_date;

SELECT *
FROM staging_hospital_data
LIMIT 5;


SELECT COUNT(*)
FROM patients;

SELECT COUNT(*)
FROM admissions;

SELECT COUNT(*)
FROM diagnoses;

SELECT *
FROM patients
LIMIT 5;

SELECT *
FROM admissions
LIMIT 5;

SELECT *
FROM diagnoses
LIMIT 5;

--Total Admission per Month
SELECT
	DATE_TRUNC('month', admission_date) AS month,
	COUNT(*) AS total_admissions
FROM admissions
GROUP BY month
ORDER BY month;


--Average Length of Stay
SELECT
	AVG(discharge_date - admission_date) AS avg_length_of_stay
FROM admissions
WHERE discharge_date IS NOT NULL;




--Average LOS BY admission type
SELECT
	admission_type,
	AVG(discharge_date - admission_date)AS avg_los
FROM admissions
WHERE discharge_date IS NOT NULL
GROUP BY admission_type


--Top diagnosis by admission Count
SELECT
	d.diagnosis_name,
	COUNT(*) AS admission_count
FROM diagnoses d
JOIN admissions a 
ON d.admission_id = a.admission_id
GROUP BY d.diagnosis_name
ORDER BY admission_count  DESC;

--Readmission Analysis
SELECT
	p.patient_name,
	COUNT(a.admission_id) AS admission_count
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING COUNT(a.admission_id) > 1;


--Admission by Age group and gender
SELECT	
	gender,
	CASE
	WHEN age < 19 THEN '0-18'
	WHEN age BETWEEN 19 AND 40 THEN '19-40'
	WHEN age BETWEEN 41 AND 60 THEN '41-60'
	ELSE '60+'
END AS age_group,
COUNT(*) AS admission
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
GROUP BY gender, age_group
ORDER BY age_group;



--Detail Quality Check
SELECT *
FROM admissions
WHERE discharge_date < admission_date;

CREATE VIEW admission_summary AS
SELECT
	a.admission_id,
	p.patient_name,
	p.age,
	p.gender,
	a.admission_date,
	a.discharge_date,
	a.admission_type,
	d.diagnosis_name,
	(a.discharge_date - a.admission_date) AS length_of_stay
FROM admissions a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN diagnoses d
ON a.admission_id = d.admission_id;


CREATE VIEW monthly_admissions AS
SELECT
	DATE_TRUNC('month', admission_date) AS month,
	COUNT(*) AS total_admissions
FROM admissions
GROUP BY month;


SELECT *
FROM admission_summary;
 
SELECT *
FROM monthly_admissions




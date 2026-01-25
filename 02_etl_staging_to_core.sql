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

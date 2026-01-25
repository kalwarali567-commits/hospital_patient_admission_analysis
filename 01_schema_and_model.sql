CREATE TABLE staging_hospital_data (
	name TEXT,
	age INT,
	gender TEXT,
	blood_type TEXT,
	medical_condition TEXT,
	admission_date DATE,
	doctor TEXT,
	hospital TEXT,
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
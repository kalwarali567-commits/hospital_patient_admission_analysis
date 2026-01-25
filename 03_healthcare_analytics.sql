-- Data validation: total admissions and coverage period
SELECT
  COUNT(*) AS total_admissions,
  MIN(admission_date) AS first_admission,
  MAX(admission_date) AS last_admission
FROM admissions;

-- Data quality check: discharge date should not be before admission date
SELECT *
FROM admissions
WHERE discharge_date < admission_date;


-- Hospital utilization by admission type
SELECT
  admission_type,
  COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_type
ORDER BY total_admissions DESC;


-- Average length of stay by admission type
SELECT
  admission_type,
  AVG(discharge_date - admission_date) AS avg_los
FROM admissions
WHERE discharge_date IS NOT NULL
GROUP BY admission_type
ORDER BY avg_los DESC;





-- Monthly admission trends
SELECT
  DATE_TRUNC('month', admission_date) AS month,
  COUNT(*) AS total_admissions
FROM admissions
GROUP BY month
ORDER BY month;





-- Admission type distribution as percentage
SELECT
  admission_type,
  COUNT(*) AS admissions,
  ROUND(
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2
  ) AS percentage
FROM staging_hospital_data
GROUP BY admission_type;




-- Admissions with longest length of stay
SELECT
  name,
  medical_condition,
  (discharge_date - admission_date) AS los_days
FROM staging_hospital_data
ORDER BY los_days DESC
LIMIT 10;



-- Admissions by age group
SELECT
  CASE
    WHEN age < 18 THEN '0-17'
    WHEN age BETWEEN 18 AND 40 THEN '18-40'
    WHEN age BETWEEN 41 AND 60 THEN '41-60'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS admissions
FROM staging_hospital_data
GROUP BY age_group
ORDER BY admissions DESC;





-- Disease distribution across age groups
SELECT
  medical_condition,
  CASE
    WHEN age < 18 THEN '0-17'
    WHEN age BETWEEN 18 AND 40 THEN '18-40'
    WHEN age BETWEEN 41 AND 60 THEN '41-60'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS admissions
FROM staging_hospital_data
GROUP BY medical_condition, age_group
ORDER BY medical_condition, admissions DESC;







-- Most frequent diagnoses by admission volume
SELECT
  d.diagnosis_name,
  COUNT(*) AS admission_count
FROM diagnoses d
JOIN admissions a
ON d.admission_id = a.admission_id
GROUP BY d.diagnosis_name
ORDER BY admission_count DESC;





-- Admission distribution by gender and age group
SELECT
  p.gender,
  CASE
    WHEN p.age < 19 THEN '0-18'
    WHEN p.age BETWEEN 19 AND 40 THEN '19-40'
    WHEN p.age BETWEEN 41 AND 60 THEN '41-60'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS admissions
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
GROUP BY p.gender, age_group
ORDER BY age_group;



-- Patients with multiple admissions (readmission proxy)
SELECT
  p.patient_name,
  COUNT(a.admission_id) AS admission_count
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING COUNT(a.admission_id) > 1
ORDER BY admission_count DESC;




-- Medication usage patterns by medical condition
SELECT
  medical_condition,
  medication,
  COUNT(*) AS usage_count
FROM staging_hospital_data
GROUP BY medical_condition, medication
ORDER BY usage_count DESC;



-- Distribution of diagnostic test results
SELECT
  test_results,
  COUNT(*) AS result_count
FROM staging_hospital_data
GROUP BY test_results
ORDER BY result_count DESC;




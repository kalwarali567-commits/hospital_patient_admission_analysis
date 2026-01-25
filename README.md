#Hospital Patient Admission Analysis (SQL)
##Project Overview

This project analyzes hospital patient admission data to understand admission patterns, length of stay (LOS), disease burden, and patient demographics. The goal is to identify operational trends that can support hospital resource planning, capacity management, and patient flow optimization.

The dataset represents real-world healthcare data challenges, including inconsistent categorical values, schema mismatches, and imperfect CSV inputs. The project emphasizes data modeling, staging workflows, and analytical SQL rather than visualization-heavy reporting.

Business Problem

Hospitals require reliable insights from admission data to improve operational efficiency and patient outcomes. Key questions addressed include:

How are patients admitted across different admission types?

Which age groups and diagnoses contribute most to hospital utilization?

How does length of stay vary by admission type and diagnosis?

Are there identifiable patterns in readmissions and high-utilization cases?

This project demonstrates how structured SQL analysis can be used to answer these questions.

Data Grain

Each row in the raw dataset represents one hospital admission (admission-level grain).

A single patient may have multiple admissions.

Admissions are uniquely identified after normalization using an admission_id.

Understanding and maintaining correct data grain was a key design consideration in this project.

Dataset

Hospital patient admission dataset (CSV)

Includes:

Patient demographics

Admission and discharge dates

Admission type

Diagnoses, medications, and test results

Data is intentionally imperfect to simulate real-world healthcare data conditions

Tools & Technologies

SQL (PostgreSQL) – Data modeling, staging tables, normalization, and analytics

Python (Pandas) – Post-SQL validation and data cleanup

Tableau Public – Dashboard creation for non-technical stakeholders

GitHub – Version control and project documentation

Database Design

The database follows a normalized hospital schema:

Patients – Patient-level demographic data

Admissions – Admission-level operational data

Diagnoses – Diagnosis and treatment details linked to admissions

A staging table was used to safely load and validate raw CSV data before insertion into final tables. Analytical queries and views were intentionally kept within a single SQL file for clarity and review simplicity.

Data Quality Challenges

Inconsistent categorical values (admission type, diagnosis names)

Date format inconsistencies

Schema mismatches during CSV loading

Logical issues such as invalid discharge dates

Initial staging table design errors

Actions Taken

Used staging tables to validate and clean raw data before insertion

Standardized categorical values

Corrected schema and data type mismatches

Implemented logical data quality checks (e.g., LOS validation)

Normalized data into patient, admission, and diagnosis tables

Practiced aggregation, trend analysis, and window functions

Validated extracted results using Python (Pandas)

Analysis Performed

Admission volume by admission type

Monthly admission trends

Average length of stay (LOS) by admission type

Disease burden analysis

Admissions by age group and gender

Readmission proxy analysis

Identification of high LOS outliers

Analysis focuses on operational efficiency and patient flow, not clinical decision-making.

Tableau Dashboard
Tableau dashboardlink;https://public.tableau.com/app/profile/muzammil.ali3402/viz/HospitalPatientAdmissionsOutcomesAnalysis/Dashboard1?publish=yes
A single Tableau dashboard was created to visualize:

Monthly admission trends

Top diagnoses by admission count

Average length of stay

Filters for date range, gender, and admission type

The dashboard is designed for clarity and usability by non-technical stakeholders.

Key Learnings

Real-world healthcare data requires careful staging and validation

Correct data grain is critical for meaningful analysis

Staging tables are essential for safe data ingestion

SQL is effective for aggregation; Python complements post-extraction cleanup

End-to-end projects build stronger analytical understanding than isolated queries

How This Project Supports My Career Goals

With a background in healthcare, this project demonstrates the ability to combine domain knowledge with data analytics skills. It reflects real-world hospital data challenges and shows practical experience in data modeling, validation, and analysis using industry-relevant tools.

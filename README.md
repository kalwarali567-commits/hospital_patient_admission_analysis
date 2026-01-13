#Hospital Patient Admissions & Outcomes Analysis
#Project Overview
Tableau dashboardlink;https://public.tableau.com/app/profile/muzammil.ali3402/viz/HospitalPatientAdmissionsOutcomesAnalysis/Dashboard1?publish=yes
This project analyzes hospital patient admission data to uncover trends related to admissions, length of stay, diagnoses, and patient demographics. The goal is to demonstrate a realistic end-to-end healthcare data analytics workflow using SQL, Python, and Tableau, focusing on data cleaning, transformation, and insight generation rather than working with perfectly clean tutorial datasets.

The project reflects real-world challenges commonly faced by data analysts in healthcare environments, including messy CSV files, schema mismatches, and inconsistent categorical values.

Business Problem

Hospitals need to better understand patient admission patterns and operational efficiency in order to:

Monitor admission trends over time

Evaluate average length of stay

Identify frequently occurring diagnoses

Improve patient flow and resource planning

This project answers: How can hospital admission data be analyzed to improve operational efficiency and support better patient outcomes?

Dataset

Hospital patient admission dataset (CSV)

Contains patient demographics, admission and discharge dates, diagnoses, admission type, and length of stay

Data is intentionally imperfect to simulate real-world healthcare data conditions

Tools & Technologies

SQL (PostgreSQL) – Data modeling, staging tables, data insertion, and analytical queries

Python (Pandas) – Post-SQL data cleaning, validation, and preprocessing

Tableau Public – Data visualization and dashboard creation

GitHub – Version control and project documentation

Database Design

The database follows a simplified hospital schema:

Patients – demographic information

Admissions – admission and discharge details

Diagnoses – diagnosis information linked to admissions

Staging tables were used to load raw CSV data safely before inserting into final tables.

Problems Identified

Raw CSV data was difficult to load and required preprocessing

Inconsistent naming in categorical columns

Date format inconsistencies across admission and discharge fields

Numeric validation issues in billing-related fields

Data insertion errors caused by incorrect staging table structure

Challenges Faced

Understanding the purpose and use of staging tables (new concept)

Learning the correct data loading and insertion workflow

Interpreting time-based trend queries

CSV loading errors due to schema mismatch and formatting issues

Adjusting to real-world data behavior instead of clean tutorial datasets

Actions Taken

Standardized inconsistent categorical values

Used staging tables to clean and validate raw data before final insertion

Resolved CSV loading and insertion issues through trial and error

Practiced SQL aggregation and trend-based queries

Cleaned and validated exported SQL results using Python (Pandas)

Prepared a clean analytical dataset for Tableau visualization

Analysis Performed

Monthly admission trends

Top diagnoses by admission count

Average length of stay

Admissions by gender and admission type

These analyses focus on operational efficiency and patient flow rather than clinical decision-making.

Tableau Dashboard

A single Tableau dashboard was created to visualize:

Monthly admissions trend

Top diagnoses

Average length of stay

Key filters (date, gender, admission type)

The dashboard is designed to be simple, clean, and suitable for non-technical stakeholders.

Key Learnings

Real-world data is rarely clean and requires careful preprocessing

Staging tables are critical for safe and structured data loading

SQL is effective for aggregation, but Python is valuable for post-extraction cleaning

Understanding why issues occur is more important than memorizing syntax

End-to-end project execution builds stronger analytical confidence than isolated practice

Current Status

Core SQL queries are understood conceptually

Practical understanding is improving with repetition

Verbal explanation skills are developing with continued exposure and practice

How This Project Helps Me

With a background in healthcare, this project demonstrates domain understanding combined with technical analytics skills. It reflects real-world hospital data challenges and shows the ability to work through imperfect data using industry-relevant tools.

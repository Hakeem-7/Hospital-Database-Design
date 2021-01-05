# Hospital-Database-Design
The database of a hospital was conceptualized, logically formatted, normalized, and translated to a relational schema in MySQL that supports queries.

## Project Description
A new hospital is being constructed to service the needs of a rapidly growing retirement community.
You have been contracted to develop the database system that will manage the primary care operation
of the hospital, but not the financial operation. 
 
Basic rules and operational procedures are described below. 

• The hospital is staffed by many types of employees including doctors, nurses, technicians, and
administrators. 
• All doctors who work for the hospital have consulting privileges, which allow them to be
assigned to patients, and order treatments for patients. Some, but not all, doctors also have
admitting privileges, which allow them to admit patients to the hospital.  
• The hospital provides both inpatient and outpatient services. Outpatient services must be
ordered by a doctor with consulting privileges. Inpatient services require a hospital stay and are
thus only available to patients who are admitted to the hospital.  
• When a patient is admitted to the hospital by a doctor, he or she is given a unique patient
identification number by an administrative employee. Each patient must provide an emergency
contact and insurance policy information at the time of admission.  
• The doctor who admits a patient is considered that patient’s primary doctor. Only that doctor
can order and perform treatments for that patient.  
• Treatments include both procedures and medication. All treatments must be ordered by a
doctor and administered by an appropriate hospital employee. Treatments may be ordered for
patients on either an inpatient or outpatient basis. A timestamp is associated with the order and
all administrations.  
• Treatments are administered to patients by one or more employees who are either doctors,
nurses, or technicians.  
• When an admitted patient’s primary doctor decides that the necessary course of treatment has 
ended, that patient is discharged from the hospital by an administrative employee. 

## Required Query Support
Your database system must support the efficient processing of each of the following information
requests.
 
A. Patient Information 
1. List all patients currently admitted to the hospital (i.e., those who are currently receiving
inpatient services). List only patient identification number and name. 
2. List all patients who have received outpatient services within a given date range. List only
patient identification number and name.  
3. For a given patient (either patient identification number or name), list all treatments that were
administered. Group treatments by admissions. List admissions in descending chronological
order, and list treatments in ascending chronological order within each admission. 

B. Diagnosis and Treatment Information 
1. List the treatments performed at the hospital (to both inpatients and outpatients), in
descending order of occurrences. List treatment identification number, name, and total number
of occurrences of each treatment. 
2. For a given treatment occurrence, list all the hospital employees that were involved. Also
include the patient name and the doctor who ordered the treatment. 

C. Employee Information 
1. For a given doctor, list all treatments that they ordered in descending order of occurrence. For
each treatment, list the total number of occurrences for the given doctor. 
2. List employees who have been involved in the treatment of every admitted patient.
3. List the primary doctors of patients with a high admission rate (at least 4 admissions within a
one-year time frame). 

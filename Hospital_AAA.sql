/* Required Query Support */



/* List all the patients currently admitted to the hospital */

select pid, firstname, lastname from patient
where discharged is NULL;

/* List all patients who have received outpatient services within a given date range. List only
patient identification number and name. */

select pid, firstname, lastname from patient
where type = 'O'; -- "O" represents Outpatient service

/* For a given patient (either patient identification number or name), list all treatments that were
administered. Group treatments by admissions. List admissions in descending chronological
order, and list treatments in ascending chronological order within each admission.  */

select patient.pid as "PatientID", treatment.description as "Description"
from patient
join administeredtreatment using (pid)
join treatment using (tid)
group by treatment.type
order by treatment.type desc;

/* List the treatments performed at the hospital (to both inpatients and outpatients), in
descending order of occurrences. List treatment identification number, name, and total number
of occurrences of each treatment. */

select tid, description, count(*) as Occurrences
from administeredtreatment
join Treatment using (tid)
group by tid, description
order by count(*) desc;

/* For a given treatment occurrence, list all the hospital employees that were involved. Also
include the patient name and the doctor who ordered the treatment. */

select treatment.description as "Treatment", employee.category as "Position", employee.lastname as "Doctor Involved", patient.lastname as "Patient"
from administeredtreatment
join treatment using (tid)
join employee using (eid)
join patient using (pid)
where orderid = '555'; -- orderid can be tweaked!

/* For a given treatment occurrence, list all the hospital employees that were involved. Also
include the patient name and the doctor who ordered the treatment.  */

select description, count(*) as Occurrence from Treatment
left outer join OrderedTreatment using (tid)
where eid = '001' -- The doctor's eid can be tweaked!
group by tid, description
order by Occurrence desc;

/* List employees who have been involved in the treatment of every admitted patient. */

select eid, firstname 
from employee
where not exists
	(select *
    from treatment
    where type = 'I' -- 'I' represent admitted patients
    and not exists
		(select *
        from administeredtreatment
        where administeredtreatment.tid = treatment.tid
        and administeredtreatment.eid = employee.eid)); -- The answer makes sense because administrators are a type of employee that ARE NOT involved in treating patients.
        
        
	/* List the primary doctors of patients with a high admission rate (at least 4 admissions within a
one-year time frame). */

select distinct firstname, lastname 
from doctor
join admittedpatient using (eid)
where admitted > admitted - interval 1 year
group by firstname, lastname
having count(*) >= 4;
/*

All tables as shown were implemented in MySQL by Akeem Ajede (2020)

Table creation order (11 Tables)
Patients
Employee
Treatment
Doctor
Nurse
Technician
Administrator
AdminDoctor
OrderedTreatment
AdministeredTreatment
AdmittedPatient

*/

DROP TABLE if exists Patient;
DROP TABLE if exists Employee;
DROP TABLE if exists Treatment;
DROP TABLE if exists Doctor;
DROP TABLE if exists Nurse;
DROP TABLE if exists Technician;
DROP TABLE if exists Administrator;
DROP TABLE if exists AdminDoctor;
DROP TABLE if exists OrderedTreatment;
DROP TABLE if exists AdministeredTreatment;
DROP TABLE if exists AdmittedPatients;


CREATE TABLE Patient( 
	pid char(3) NOT NULL,
	firstname varchar(20),
	lastname varchar(20),
	insurance varchar(20), 
	contact varchar(20),
	type char(1), -- I, for Inpatient, O for Outpatient
	admitted date,
	discharged date,
	PRIMARY KEY (pid)
);
CREATE TABLE Employee(
	eid char(3) NOT NULL, -- consider making this unique
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	category varchar(20),
	PRIMARY KEY (eid)
);
CREATE TABLE Treatment(
	tid char(3), -- consider making this unique
	description varchar(20),
	type char(1), -- either Inpatient or Outpatient
	PRIMARY KEY (tid)
);
CREATE TABLE Doctor(
	eid char(3),
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);
CREATE TABLE Nurse(
	eid char(3),
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);
CREATE TABLE Technician(
	eid char(3),
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);
CREATE TABLE Administrator(
	eid char(3),
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);
CREATE TABLE AdminDoctor(
	eid char(3),
	firstname varchar(20), 
	lastname varchar(20),
	doh date,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Doctor(eid)
);
CREATE TABLE OrderedTreatment(
	orderid char(3) UNIQUE,
	tid char(3),
	pid char(3),
	eid char(3),
	timeordered date,
	PRIMARY KEY (tid, eid, pid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (eid) REFERENCES Doctor(eid),
	FOREIGN KEY (pid) REFERENCES Patient(pid)
);
CREATE TABLE AdministeredTreatment(
	orderid char(3),
	tid char(3),
	pid char(3),
	eid char(3),
	type char(1),
	time date, -- default CURRENT_DATE,
	PRIMARY KEY (tid, eid, pid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (eid) REFERENCES Employee(eid),
	FOREIGN KEY (pid) REFERENCES Patient(pid)
);

CREATE TABLE AdmittedPatient(
	pid char(3),
	eid char(3),
	admitted date, 
	discharged date,
	PRIMARY KEY (pid, eid, admitted),
	FOREIGN KEY (pid) REFERENCES Patient(pid),
	FOREIGN KEY (eid) REFERENCES AdminDoctor(eid)
);
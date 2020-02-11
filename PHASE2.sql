/* DROP TABLE STATEMENT*/
DROP TABLE Employee CASCADE CONSTRAINTS PURGE;
DROP TABLE EquipmentType CASCADE CONSTRAINTS PURGE;
DROP TABLE Equipment CASCADE CONSTRAINTS PURGE;
DROP TABLE Room CASCADE CONSTRAINTS PURGE;
DROP TABLE Roomservice CASCADE CONSTRAINTS PURGE;
DROP TABLE RoomAccess CASCADE CONSTRAINTS PURGE;
DROP TABLE Patient CASCADE CONSTRAINTS PURGE;
DROP TABLE Doctor CASCADE CONSTRAINTS PURGE;
DROP TABLE Admission CASCADE CONSTRAINTS PURGE;
DROP TABLE Examine CASCADE CONSTRAINTS PURGE;
DROP TABLE StayIn CASCADE CONSTRAINTS PURGE;

/* CREATE TABLE STATEMENTS*/
create Table Employee
(ID INTEGER PRIMARY KEY,
FirstName varCHAR(20) NOT NUll,
LastName varCHAR (20) NOT NULL,
Salary INTEGER,
jobTitle varCHAR(40),
officeNum INTEGER,
empRank INTEGER,
supervisorID INTEGER);

create Table EquipmentType
(ID CHAR(10) PRIMARY KEY,
Descr varchar(100),
Model VARCHAR(20),
Instructions LONG,
numberOfUnits INTEGER);

create Table Equipment
(Serial# CHAR(7) PRIMARY KEY,
TypeID varCHAR(10),
PurchaseYear INTEGER,
LastInspection DATE,
roomNum INTEGER );

create Table Room
(Num INTEGER PRIMARY KEY,
occupiedFlag INTEGER);

create Table RoomService
(roomNum INTEGER REFERENCES Room (Num),
Service varchar(50),
CONSTRAINTS RoomService_PK PRIMARY KEY (roomNum, Service));

create Table RoomAccess
(roomNum INTEGER REFERENCES Room (Num),
EmpID INTEGER REFERENCES Employee(ID),
CONSTRAINTS RoomAccess_PK PRIMARY KEY (roomNum, EmpID));

create Table Patient
(SSN Char(10) Primary Key,
FirstName varchar(20),
LastName varchar(20),
Address varchar(20),
TelNum INTEGER);

create table Doctor 
(ID CHAR(10) Primary key,
Gender INTEGER,
Specialty VarChar(30),
LastName VarChar(20) NOT NULL,
FirstName Varchar(20) NOT NULL);

create table Admission
(Num integer,
admissionDate Date,
leaveDate Date,
totalPayment Integer,
insurancePayment Integer,
futureVisit Date,
Patient_SSN REFERENCES Patient (SSN),
CONSTRAINTS Admission_PK PRIMARY KEY ( Num));

create table Examine
(DoctorID CHAR(10) REFERENCES Doctor (ID),
admissionNum INTEGER REFERENCES Admission (Num),
Comments LONG,
CONSTRAINTS Examine_PK PRIMARY KEY (DoctorId, admissionNum));

Create table StayIn
(admissionNum INTEGER REFERENCES Admission (Num),
roomNum INTEGER REFERENCES Room (Num),
startDate Date,
endDate Date,
CONSTRAINTS StayIn_PK PRIMARY KEY (roomNum, admissionNum, startDate));




/* Insert data for 10 patients */

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (111223333, 'John', 'Smith', '100 Stone rd.', 0565554444);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (222334444, 'Bobby', 'Dingus', '69 Lil st.', 2324422987);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (333445555, 'Todd', 'Chaves', '8 Bojack ln.', 9828376654);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (444556666, 'Dianne', 'Nyggween', '52 Friend rd.', 4762367892);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (555667777, 'Jack', 'Sparrow', '7 Pearl ln.', 82657349299);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (666778888, 'Mister', 'Clean', '89 Smooth ln.', 2123336745);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (777889999, 'Steve', 'Chlamydia', '43 Unfortunate rd.', 7826374590);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (888990000, 'Big', 'Boi', '80 Chunky ln.', 2783672658);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (999001111, 'Squat', 'Nash', '45 Gainz st.', 6726487794);

INSERT INTO Patient (SSN, FirstName, LastName, Address, TelNum)
VALUES (000112222, 'Ligma', 'Gullible', '420 Bantz st.', 6782675626);

/* Insert data for 10 Doctors */

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('8HSK339JN3', 1, 'Surgeon', 'Dingo', 'Cheff');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('J73K9SU5N3', 0, 'Phsychologist', 'Fredd', 'Cook');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('H38HS9K44H', 1, 'Surgeon', 'Boi', 'Hel');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('H73KS9HJJS', 1, 'Pediatrician', 'Ninedeez', 'Nostalya');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('S9HJ23NAS8', 0, 'Phsychologist', 'Gatch', 'Aust');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('H37SJJS90B', 1, 'Gynocologist', 'Rip', 'Kobe');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('SNB39834BJ', 0, 'Pediatrician', 'Colombo', 'Chrissy');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('BSA7H3340M', 0, 'Gynocologist', 'Pascal', 'Blaze');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('NSHD8N2OIU', 1, 'Phsychologist', 'Jenrate', 'Randy');

INSERT INTO Doctor (ID, gender, specialty, LastName, FirstName)
VALUES ('S9U8HNSK82', 1, 'Surgeon', 'Akt', 'Klass');


/* Insert data for 10 Rooms (>= 3 rooms have >= 2 services) */

INSERT INTO Room (Num, occupiedflag)
VALUES (101, 1);

INSERT INTO Room (Num, occupiedflag)
VALUES (302, 0);

INSERT INTO Room (Num, occupiedflag)
VALUES (402, 1);

INSERT INTO Room (Num, occupiedflag)
VALUES (128, 1);

INSERT INTO Room (Num, occupiedflag)
VALUES (301, 0);

INSERT INTO Room (Num, occupiedflag)
VALUES (324, 1);

INSERT INTO Room (Num, occupiedflag)
VALUES (182, 0);

INSERT INTO Room (Num, occupiedflag)
VALUES (203, 1);
INSERT INTO RoomService (roomNum, service)
VALUES (203, 'Emergency Room');
INSERT INTO RoomService (roomNum, service)
VALUES (203, 'Quarentine Room');

INSERT INTO Room (Num, occupiedflag)
VALUES (152, 1);
INSERT INTO RoomService (roomNum, service)
VALUES (152, 'Emergency Room');
INSERT INTO RoomService (roomNum, service)
VALUES (152, 'Fire Meeting Point');

INSERT INTO Room (Num, occupiedflag)
VALUES (281, 1);
INSERT INTO RoomService (roomNum, service)
VALUES (281, 'Checkup Room');
INSERT INTO RoomService (roomNum, service)
VALUES (281, 'Quarentine Room');

/* Insert data for 3 EquipmentType */

INSERT INTO EquipmentType (ID, Descr, Model, Instructions, numberOfUnits)
VALUES ('MRI', 'Discover someones deepest secrets via powerful magnets and radio waves.',
 'LegoFinder3', 'Step 1: Make sure patient doesnt freak out. Step 2: Turn it on. Step 3: Look at the pretty picture.',
4);

INSERT INTO EquipmentType (ID, Descr, Model, Instructions, numberOfUnits)
VALUES ('Ultrasound','Rubby rubby lets find out whats in the tummy.',
 'BabyGlass', 'Gently massage area of interest to create internal model.', 20);

INSERT INTO EquipmentType (ID, Descr, Model, Instructions, numberOfUnits)
VALUES ('CT Scanner', 'If you did 8 years of school you should know what computer tomography scanner means, duh.',
 'XRD4000', 'Idk figure it out, try pressing the on button.', 8);

/* Insert data for 9 Equipment (3 of each type)  */

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('AO1-O2X', 'CT Scanner', 1996, '14-MAY-17', 281);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('S8H-3NN', 'Ultrasound', 2006, '23-MAY-17', 203);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('WKO-IHI', 'Ultrasound', 2006, '25-MAY-17', 115);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('NH9-2B3', 'MRI', 2010, '28-AUG-17', 152);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('219-08I', 'MRI', 2006, '09-DEC-19', 301);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('SNF-873', 'CT Scanner', 2005, '05-NOV-18', 182);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('BNJ-F78', 'CT Scanner', 2010, '28-MAY-17', 203);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('D71-893', 'MRI', 2011, '08-DEC-19', 302);

INSERT INTO Equipment (Serial#, TypeID, PurchaseYear, LastInspection, roomNum)
VALUES ('SFJ-901', 'Ultrasound', 2001, '30-JAN-19', 152);

/* Insert data for 10 Admissions (>= 2 visits each for >= 5 patients) */

INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (1, '14-MAR-19', '16-MAR-19', 2500, 2000, 111223333, '01-JAN-20');
INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (2, '01-JAN-20', '06-JAN-20', 5600, 3400, 111223333, '05-APR-20');

INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (3, '23-MAY-14', '23-MAY-15', 1800, 300, 111223333, '01-JUL-14');
INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (8, '07-AUG-17', '10-AUG-17', 4000, 450, 222334444, '05-DEC-17');

INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (5, '21-JUN-16', '21-JUN-16', 900, 600, 333445555, '01-SEP-16');
INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (6, '01-SEP-16', '02-SEP-16', 1000, 450, 333445555, '08-FEB-17');

INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (13, '07-FEB-19', '09-FEB-19', 1200, 200, 444556666, '02-MAY-19');
INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, FutureVisit)
VALUES (14, '02-MAY-19', '05-MAY-19', 1500, 900, 444556666, '28-AUG-19');

INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (7, '16-OCT-12', '17-OCT-12', 8000, 400, 555667777, '05-JAN-13');
INSERT INTO Admission (Num, admissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN, futureVisit)
VALUES (16, '01-APR-19', '05-APR-19', 16000, 4000, 555667777, '24-JUL-19');

/* Insert data for 16 Employees (10 regular, 4 division managers, 2 general managers) */

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (1, 'Mookie', 'Betts', 50000, 'Nurse', 501, 0, 11);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (2, 'David', 'Price', 63000, 'Point Guard', 115, 0, 11);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (3, 'Justin', 'Martinez', 52000, 'Hype Man', 502, 0, 12);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (4, 'Dustin', 'Pedroia', 82000, 'Human Resources', 503, 0, 12);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (5, 'Chris', 'Sale', 83500, 'Tester', 504, 0, 12);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (6, 'Andrew', 'Beantown', 126000, 'Janitor', 505, 0, 13);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (7, 'Xander', 'Bogaerts', 75500, 'Software Engineer I', 506, 0, 13);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (8, 'Donald', 'Biggod', 58500, 'Janitor', 507, 0, 14);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (9, 'Jackie', 'Bradley', 68000, 'Customer Service', 508, 0, 14);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (10, 'Rafael', 'Devers', 129000, 'Marketing Creative', 509, 0, 14);

/* Division Managers*/
INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (11, 'Matt', 'Barnes', 152000, 'Personal Relations Manager', 510, 1, 15);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (12, 'Jose', 'Pareza', 138000, 'Surgeon Manager', 511, 1, 15);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (13, 'Josh', 'Osich', 169000, 'Regional Manager of Sales Scranton', 512, 1, 16);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (14, 'Heath', 'Harambe', 127000, 'Manager of Sales', 513, 1,16);

/* General Managers*/
INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (15, 'Jeffrey', 'Springs', 184000, 'Efficiency King', 514, 2, 9000);

INSERT INTO Employee (ID, FirstName, LastName, Salary, jobTitle, officeNum, empRank, supervisorID)
VALUES (16, 'Tzu-Wei', 'Lin', 203000, 'Internal Logistics Manager', 516, 2, 69);

/* Room Access Info */
INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (101, 3);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (302, 2);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (402, 15);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (182, 2);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (128, 15);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (301, 4);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (203, 8);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (324, 15);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (152, 16);

INSERT INTO RoomAccess(roomNum, EmpID)
VALUES (281, 15);

/* Examine Info */

INSERT INTO Examine (DoctorID, admissionNum, Comments)
VALUES ('J73K9SU5N3', 2, 'This sude came in with 5 legos in his stomach. 
Disnt ask how, but ill accept it.');

INSERT INTO Examine (DoctorID, admissionNum, Comments)
VALUES ('J73K9SU5N3', 1, 'I hate my job.');

INSERT INTO Examine (DoctorID, admissionNum, Comments)
VALUES ('S9U8HNSK82', 5, 'No one taught me how to type im just a doctor.');

INSERT INTO Examine (DoctorID, admissionNum, Comments)
VALUES ('J73K9SU5N3', 3, 'The mitochondria is the powerhouse of the cell.');


SELECT Num
FROM Room
WHERE occupiedflag=1;

SELECT FirstName,LastName, Salary
FROM  Employee
WHERE supervisorID = 11;

SELECT Patient_SSN,sum(InsurancePayment) as Sum
FROM Admission 
GROUP BY Patient_SSN;

SELECT Patient_SSN, FirstName,LastName,Count(FutureVisit) as NumberVisits
FROM Admission,Patient
Where Admission.Patient_SSN=Patient.SSN
GROUP BY Patient_SSN, FirstName, LastName;

SELECT roomNum
FROM Equipment
WHERE Serial#='AO1-O2X';

SELECT EmpID, Count(EmpID) as Numrooms
FROM RoomAccess
GROUP BY EmpID
HAVING Count(EmpID)=(SELECT Max(NumRooms) FROM (SELECT Count(EmpID) As NumRooms FROM RoomAccess GROUP BY EmpID));

SELECT emprank as Type, Count(emprank) as Count
FROM Employee
GROUP BY emprank;

SELECT Patient_SSN,FirstName,LastName,FutureVisit
FROM Patient,Admission
WHERE Admission.Patient_SSN=Patient.SSN AND Admission.FutureVisit IS NOT NULL;

SELECT ID,model,numberofUnits
FROM EquipmentType
WHERE numberofUnits>3;

SELECT FutureVisit
FROM Admission
WHERE Patient_SSN = '111223333';

SELECT DoctorID,count(AdmissionNum) as TimesExamined
FROM Examine,Admission
WHERE Admission.Num=Examine.AdmissionNum AND Admission.Patient_SSN='111223333'
HAVING count(admissionNum)>2
GROUP BY DoctorID;


SELECT E1.TypeID
FROM Equipment E1
WHERE PurchaseYear=2010
INTERSECT
SELECT E2.TypeID
FROM Equipment E2
WHERE PurchaseYear=2011;



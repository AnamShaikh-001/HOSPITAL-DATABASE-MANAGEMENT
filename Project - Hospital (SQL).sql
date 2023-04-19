                                                                 # PROJECT HOSPITAL #

USE hospital;

-- The following questions are answered in reference to the database named 'Hospital'.

# 1.write a SQL query to identify the physicians who are the department heads.
# Return Department name as “Department” and Physician name as “Physician”.

SELECT *
FROM physician;
SELECT *
FROM department;

SELECT 
d.name AS 'Department',
p.name AS 'Physician'
FROM physician as p
INNER JOIN department as d
ON p.employeeid = d.head;

-- The above query gives information regarding the physicians who are the head of their respective departments.--

# 2. write a SQL query to locate the floor and block where room number 212 is located. 
#Return block floor as "Floor" and block code as "Block".

SELECT * 
FROM room;

SELECT 
blockfloor AS 'Floor',
blockcode AS 'Block'
FROM room
WHERE roomnumber = 212;

-- The above query fetches information regarding the exact location of Room number '212'.--

# 3. write a SQL query to count the number of unavailable rooms. Return count as "Number of unavailable rooms".

SELECT *
FROM room;

SELECT 
COUNT(*) AS 'No. of unavailable rooms'
FROM room
WHERE unavailable = 't';

-- The above query gives the data regarding the number of unavailable rooms in the hospital.--

# 4. write a SQL query to identify the physician and the department with which he or she is affiliated. 
#Return Physician name as "Physician", and department name as "Department". 

SELECT *
FROM physician;
SELECT *
FROM department;

SELECT 
p.name as 'Physician',
d.name as 'Department'
FROM physician as p
INNER JOIN affiliated_with as a
ON p.employeeid = a.physician
INNER JOIN department as d
ON d.departmentid = a.department;

-- The above query fetches the data regarding the physicians and their respective departments.--

# 5. write a SQL query to find those physicians who have received special training.
# Return Physician name as “Physician”, treatment procedure name as "Treatment".

SELECT *
FROM physician;
SELECT *
FROM trained_in;

SELECT 
p.name AS 'Physician',
t.treatment AS 'Treatment'
FROM physician AS p
INNER JOIN trained_in AS t
ON p.employeeid = t.physician;

-- The query gives the data regarding the physicians who have recieved special training.--

# 6. write a SQL query to find those physicians who are yet to be affiliated.
# Return Physician name as "Physician", Position, and department as "Department". 

SELECT * 
FROM physician;
SELECT * 
FROM department;
SELECT *
FROM affiliated_with;

SELECT 
p.name AS 'Physician',
p.position as 'Position',
d.name AS 'Department'
FROM physician AS p
INNER JOIN affiliated_with as a 
ON p.employeeid = a.physician
INNER JOIN department as d
ON d.departmentid = a.department
WHERE a.primaryaffiliation = 'f';

-- The query gives information regarding the physicians who are yet to be affiliated.--

# 7. write a SQL query to identify physicians who are not specialists. Return Physician name as "Physician", position as "Designation".

SELECT *
FROM physician;
SELECT *
FROM trained_in;

SELECT
p.name AS 'Physician',
p.position AS 'Designation'
FROM physician as p
LEFT JOIN trained_in as t
ON p.employeeid = t.physician
WHERE t.treatment IS NULL;

-- The above query fetches data regarding The physicians who are not specialists are as follows--

# 8. write a SQL query to identify the patients and the number of physicians with whom they have scheduled appointments. 
#Return Patient name as "Patient", number of Physicians as "Appointment for No. of Physicians".

SELECT *
FROM patient;
SELECT *
FROM appointment;

SELECT 
p.name as 'Patient',
COUNT(a.patient) as 'Appointment for No. of physicians'
FROM patient as p
INNER JOIN appointment as a
ON p.ssn = a.patient
GROUP BY p.name
HAVING COUNT(a.patient)>=1;

-- The query calls the data regarding the patients who have a scheduled appointments with their respective physicians.--

# 9. write a SQL query to count the number of unique patients who have been scheduled for examination room 'C'.
# Return unique patients as "No. of patients got appointment for room C". 

SELECT *
FROM appointment;

SELECT 
COUNT(DISTINCT patient)
FROM appointment 
WHERE examinationroom = 'C';

-- The query gives the information regarding the number of patients who have a scheduled appointment at examination room 'C'.--

# 10. write a SQL query to identify the nurses and the room in which they will assist the physicians. 
#Return Nurse Name as "Name of the Nurse" and examination room as "Room No.". 

SELECT *
FROM nurse;
SELECT *
FROM appointment;

SELECT 
n.name as 'Name of the Nurse',
a.examinationroom as 'Room No.'
FROM nurse as n
INNER JOIN appointment as a 
ON n.employeeid = a.prepnurse;

-- The given query gives fetches data regarding the names of the nurses who will assist in their respective examination rooms.--

# 11. write a SQL query to locate the patients' treating physicians and medications. 
#Return Patient name as "Patient", Physician name as "Physician", Medication name as "Medication". 

SELECT * 
FROM appointment;
SELECT *
FROM prescribes;
SELECT *
FROM medication;

SELECT 
p.name as 'Patient',
q.name as 'Physician',
m.name as 'Medication'
FROM appointment as a
INNER JOIN prescribes as w
ON a.patient = w.patient 
INNER JOIN physician as q
ON q.employeeid = w.physician
INNER JOIN medication as m 
ON m.code = w.medication 
INNER JOIN patient as p
ON p.ssn = w.patient;

-- The above query fetches information regardingThe patients and their prescribed medication as per their physicians.--

# 12. write a SQL query to count the number of available rooms in each block. Sort the result-set on ID of the block. 
#Return ID of the block as "Block", count number of available rooms as "Number of available rooms".

SELECT *
FROM room;

SELECT 
blockcode as 'Block',
COUNT(*) as 'Number of available rooms'
FROM room
WHERE unavailable = 'F'
GROUP BY blockcode 
ORDER BY blockcode;

-- The above query gives information regarding the number of rooms available at the hospital at each block.--

#13. write a SQL query to count the number of available rooms for each floor in each block. Sort the result-set on floor ID, ID of the block. 
#Return the floor ID as "Floor", ID of the block as "Block", and number of available rooms as "Number of available rooms".

SELECT blockfloor AS "Floor",
       blockcode AS "Block",
       count(*) "Number of available rooms"
FROM room
WHERE unavailable='f'
GROUP BY blockfloor,
         blockcode
ORDER BY blockfloor,
        blockcode;
-- The query fetches the data regarding the number of rooms available on each floor of each block in the hospital.--

# 14. write a SQL query to count the number of rooms that are unavailable in each block and on each floor. 
# Sort the result-set on block floor, block code. 

SELECT *
FROM room;

SELECT 
COUNT(*) as 'No. of rooms unavailable',
blockcode as 'Block',
blockfloor as 'Floor'
FROM room
WHERE unavailable = 't'
GROUP BY blockfloor, blockcode
ORDER BY blockcode, blockfloor;

-- The query fetches information regarding the number of rooms unaavailable on the floors or each block are as follows--

# 15. write a SQL query to find the name of the patients, their block, floor, and room number where they admitted.

SELECT *
FROM patient;
SELECT *
FROM room;
SELECT *
FROM stay;

SELECT 
p.name as 'Patient',
r.blockcode as 'Block',
r.blockfloor as 'Floor',
r.roomnumber as 'Room Number'
FROM patient as p
INNER JOIN stay as s
ON p.ssn = s.patient
INNER JOIN room as r
ON r.roomnumber = s.room;

-- The query gives data regarding The patients admitted along with their block, floor and room number.--

# 16. write a SQL query to find all physicians who have performed a medical procedure but are not certified to do so.
# Return Physician name as "Physician".
USE hospital;
SELECT *
FROM Physician;
SELECT *
FROM undergoes;

SELECT 
p.name as 'Physician'
FROM physician as p
WHERE employeeid IN (SELECT undergoes.physician 
					 FROM undergoes
                     LEFT JOIN trained_in 
                     ON undergoes.physician = trained_in.physician
                     AND undergoes.procedure = trained_in.treatment
                     WHERE treatment is NULL);
                     
-- The above query fetches data regarding he following are the physicians who have performed a medical procedure but are not certified to do so.--

# 17. write a SQL query to determine which patients have been prescribed medication by their primary care physician.
# Return Patient name as "Patient", and Physician Name as "Physician".

SELECT 
p.name as 'Patient',
a.name as 'Physician'
FROM patient as p
INNER JOIN prescribes as b
ON p.ssn = b.patient
INNER JOIN physician as a 
ON a.employeeid = b.physician;                                                                                                                                                                          aq

-- The above query gives information regarding The following patients have been prescribed medication by their primary healthcare physicians--

# 18.write a SQL query to find those patients who have undergone a procedure costing more than $5,000, 
# as well as the name of the physician who has provided primary care, should be identified. 
#Return name of the patient as "Patient", name of the physician as "Primary Physician", and cost for the procedure as "Procedure Cost".

SELECT 
p.name as 'Patient',
a.name as 'Primary Physician',
c.cost as 'Procedure Cost'
FROM procedures as c
INNER JOIN undergoes as u
ON c.code = u.procedure
INNER JOIN patient as p
ON p.ssn = u.patient
INNER JOIN physician as a 
ON a.employeeid = u.physician
WHERE c.cost > 5000;

-- The above query fetches information regarding The patients along with their physicians who's medical procedure costs more than $5000.--

# 19. Write an SQL query to identify those patients whose primary care is provided by a physician who is not the head of any department. 
# Return Patient name as "Patient", Physician Name as "Primary care Physician".

SELECT 
p.name as 'Patient',
a.name as 'Primary care physican'
FROM physician as a 
INNER JOIN department as d
ON a.employeeid = d.head
INNER JOIN patient as p
ON a.employeeid = p.pcp
WHERE p.pcp NOT IN (SELECT head 
FROM department);

SELECT pt.name AS "Patient",
       p.name AS "Primary care Physician"
FROM patient pt
JOIN physician p ON pt.pcp=p.employeeid
WHERE pt.pcp NOT IN
    (SELECT head
     FROM department);
     
-- The query fetches data regarding the patients who's primary care are provides by physicians who are not the head of any department.--

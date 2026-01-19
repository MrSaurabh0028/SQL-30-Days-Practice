----------------------------------DAY 5-----------------------------------
CREATE TABLE employ(
	employ_id SERIAL,
	name VARCHAR(50),
	dept VARCHAR(50),
	marks NUMERIC(2),
	city VARCHAR(50)
);
SELECT * FROM employ;

INSERT INTO employ(name,dept,marks,city)
	VALUES('Rahul','CS',82,'Delhi'),
		('Sohan','IT',67,'Mumbai'),
		('Reena','CS',91,'Delhi'),
		('Aman','Civil',55,'Pune'),
		('Pooja','CS',73,'Jaipur'),
		('Imran','Mech',48,'Delhi'),
		('Simran','IT',88,'Mumbai');


		CREATE TABLE student(
	employ_id SERIAL,
	name VARCHAR(50),
	dept VARCHAR(50),
	marks NUMERIC(2),
	city VARCHAR(50)
);

SELECT * FROM student;

ALTER TABLE student
RENAME COLUMN employ_id TO id;

INSERT INTO student(name,dept,marks,city)
	VALUES('Rahul','CS',82,'Delhi'),
		('Sohan','IT',67,'Mumbai'),
		('Reena','CS',91,'Delhi'),
		('Aman','Civil',55,'Pune'),
		('Pooja','CS',73,'Jaipur'),
		('Imran','Mech',48,'Delhi'),
		('Simran','IT',88,'Mumbai'),
		('Rahul', 'CS', 82, 'Delhi'),
		('Sohan', 'IT', 67, 'Mumbai'),
		('Reena', 'CS', 91, 'Delhi'),
		('Aman', 'Civil', 55, 'Pune'),
		('Pooja', 'CS', 73, 'Jaipur'),
		('Imran', 'Mech', 48, 'Delhi'),
		('Simran', 'IT', 88, 'Mumbai'),
		('Kunal', 'CS', 79, 'Delhi'),
		('Mahima', 'IT', 65, 'Kolkata'),
		('Tanya', 'Civil', 58, 'Pune'),
		('Suresh', 'Mech', 62, 'Chennai'),
		('Deepak', 'CS', 84, 'Delhi'),
		('Ritika', 'IT', 72, 'Mumbai'),
		('Harsh', 'Civil', 53, 'Indore'),
		('Kritika', 'CS', 90, 'Delhi'),
		('Aditya', 'Mech', 47, 'Bhopal'),
		('Nikita', 'IT', 76, 'Surat'),
		('Jatin', 'CS', 81, 'Lucknow'),
		('Prachi', 'Civil', 57, 'Pune'),
		('Vikas', 'Mech', 61, 'Delhi'),
		('Neha', 'IT', 87, 'Mumbai'),
		('Rohit', 'CS', 74, 'Delhi'),
		('Anushka', 'CS', 92, 'Kolkata'),
		('Manish', 'IT', 66, 'Surat'),
		('Kiran', 'Civil', 54, 'Bhopal'),
		('Arjun', 'Mech', 60, 'Chennai'),
		('Sneha', 'CS', 89, 'Jaipur'),
		('Dev', 'IT', 78, 'Delhi'),
		('Payal', 'Civil', 52, 'Indore'),
		('Sahil', 'Mech', 59, 'Mumbai'),
		('Zoya', 'IT', 71, 'Kolkata'),
		('Gaurav', 'CS', 83, 'Delhi'),
		('Isha', 'Civil', 56, 'Pune'),
		('Farhan', 'IT', 63, 'Hyderabad'),
		('Aniket', 'CS', 85, 'Delhi'),
		('Lavanya', 'Mech', 50, 'Chennai'),
		('Tarun', 'CS', 80, 'Lucknow'),
		('Bhavna', 'IT', 69, 'Surat'),
		('Ajay', 'Civil', 57, 'Jaipur'),
		('Monika', 'Mech', 64, 'Mumbai'),
		('Yash', 'CS', 77, 'Delhi'),
		('Shreya', 'IT', 86, 'Kolkata'),
		('Nilesh', 'Civil', 51, 'Pune'),
		('Priya', 'CS', 88, 'Delhi'),
		('Kabir', 'IT', 73, 'Surat'),
		('Sana', 'Civil', 49, 'Indore'),
		('Hemant', 'Mech', 68, 'Bhopal'),
		('Divya', 'CS', 93, 'Delhi');


DAY-5 SOLVED (SQL JOINS – ANSWERS)

INNER JOIN
--Q1. Display student name and department name
SELECT s.name, s.dept
FROM student s
INNER JOIN employ e
ON s.dept = e.dept;

--Q2. Show all students who belong to a department
SELECT s.*
FROM student s
JOIN employ e
ON s.dept = e.dept;

--Q3. Display department-wise total students
SELECT s.dept, COUNT(*) AS total_students
FROM student s
JOIN employ e
ON s.dept = e.dept
GROUP BY s.dept;

--Q4. Show students whose department is ‘CS’
SELECT s.*
FROM student s
JOIN employ e
ON s.dept = e.dept
WHERE s.dept = 'CS';

LEFT JOIN
--Q5. Display all students, even if they don’t belong to any department
SELECT s.name, s.dept
FROM student s
LEFT JOIN employ e
ON s.dept = e.dept;

--Q6. Show students with NULL department match
SELECT s.name, s.dept
FROM student s
LEFT JOIN employ e
ON s.dept = e.dept
WHERE e.dept IS NULL;

--Q7. Display all departments and number of students
SELECT e.dept, COUNT(s.name) AS total_students
FROM employ e
LEFT JOIN student s
ON s.dept = e.dept
GROUP BY e.dept;

RIGHT JOIN
--Q8. Display all departments, even those without students
SELECT e.dept, s.name
FROM student s
RIGHT JOIN employ e
ON s.dept = e.dept;

--Q9. Show departments that do not have any students
SELECT e.dept
FROM student s
RIGHT JOIN employ e
ON s.dept = e.dept
WHERE s.name IS NULL;

FULL JOIN
--Q10. Display all students and all departments
SELECT s.name, e.dept
FROM student s
FULL JOIN employ e
ON s.dept = e.dept;

JOIN + GROUP BY / WHERE
--Q11. Display department name and average student ID
SELECT s.dept, AVG(s.id) AS avg_student_id
FROM student s
JOIN employ e
ON s.dept = e.dept
GROUP BY s.dept;

--Q12. Display department name and count of students
SELECT s.dept, COUNT(*) AS total_students
FROM student s
JOIN employ e
ON s.dept = e.dept
GROUP BY s.dept;

--Q13. Show departments having more than 5 students
SELECT s.dept
FROM student s
JOIN employ e
ON s.dept = e.dept
GROUP BY s.dept
HAVING COUNT(*) > 5;

--Q14. Display students where department starts with ‘C’
SELECT s.name, s.dept
FROM student s
JOIN employ e
ON s.dept = e.dept
WHERE s.dept LIKE 'C%';

ADVANCED THINKING
--Q15. Display students not assigned to any department
SELECT s.*
FROM student s
LEFT JOIN employ e
ON s.dept = e.dept
WHERE e.dept IS NULL;

--Q16. Display departments that have at least one student
SELECT DISTINCT e.dept
FROM employ e
JOIN student s
ON s.dept = e.dept;

--Q17. Display students and departments sorted by department
SELECT s.name, s.dept
FROM student s
JOIN employ e
ON s.dept = e.dept
ORDER BY s.dept;

--Q18. Display students whose department is missing in employ table
SELECT s.name, s.dept
FROM student s
LEFT JOIN employ e
ON s.dept = e.dept
WHERE e.dept IS NULL;

--Q19. Display department-wise highest student id
SELECT dept, MAX(id) AS highest_student_id
FROM student
GROUP BY dept;

--Q20. Display department name and student name for all records
SELECT s.name AS student_name, e.dept
FROM student s
FULL JOIN employ e
ON s.dept = e.dept;

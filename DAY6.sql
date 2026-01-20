----------------------------------DAY 6-----------------------------------
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


DAY 6 – SQL SUBQUERIES (WITH ANSWERS)

 BASIC SUBQUERIES
--Q1. Find students who have marks greater than the average marks.
SELECT *
FROM student
WHERE marks > (
    SELECT AVG(marks)
    FROM student
);

--Q2. Find students who belong to the same department as 'Rahul'.
SELECT *
FROM student
WHERE dept = (
    SELECT dept
    FROM student
    WHERE name = 'Rahul'
);

--Q3. Find the student(s) with the highest marks.
SELECT *
FROM student
WHERE marks = (
    SELECT MAX(marks)
    FROM student
);

--Q4. Find students who scored the minimum marks.
SELECT *
FROM student
WHERE marks = (
    SELECT MIN(marks)
    FROM student
);

--Q5. Find students whose marks are greater than Rahul’s marks.
SELECT *
FROM student
WHERE marks > (
    SELECT marks
    FROM student
    WHERE name = 'Rahul'
);

SUBQUERY WITH IN

--Q6. Find students who belong to departments where employees exist.
SELECT *
FROM student
WHERE dept IN (
    SELECT dept
    FROM employ
);

--Q7. Find students whose department does not exist in employ table.
SELECT *
FROM student
WHERE dept NOT IN (
    SELECT dept
    FROM employ
);

--Q8. Find students belonging to CS or IT departments using subquery.
SELECT *
FROM student
WHERE dept IN (
    SELECT dept
    FROM employ
    WHERE dept IN ('CS', 'IT')
);


SUBQUERY WITH EXISTS
--Q9. Find students only if at least one employee exists in the same department.
SELECT *
FROM student s
WHERE EXISTS (
    SELECT 1
    FROM employ e
    WHERE e.dept = s.dept
);

--Q10. Find students whose department has no employees.
SELECT *
FROM student s
WHERE NOT EXISTS (
    SELECT 1
    FROM employ e
    WHERE e.dept = s.dept
);

 SUBQUERY WITH AGGREGATE + GROUP BY
--Q11. Find departments where average student marks > 75.
SELECT dept
FROM student
GROUP BY dept
HAVING AVG(marks) > 75;

--Q12. Find students from departments whose average marks > 75.
SELECT *
FROM student
WHERE dept IN (
    SELECT dept
    FROM student
    GROUP BY dept
    HAVING AVG(marks) > 75
);

CORRELATED SUBQUERIES (IMPORTANT)
--Q13. Find students who have highest marks in their department.
SELECT *
FROM student s
WHERE marks = (
    SELECT MAX(marks)
    FROM student
    WHERE dept = s.dept
);

--Q14. Find students whose marks are greater than department average.
SELECT *
FROM student s
WHERE marks > (
    SELECT AVG(marks)
    FROM student
    WHERE dept = s.dept
);

 ADVANCED PRACTICE

--Q15. Find the second highest marks from student table.
SELECT MAX(marks)
FROM student
WHERE marks < (
    SELECT MAX(marks)
    FROM student
);

--Q16. Find students who are not in the top scoring department.
SELECT *
FROM student
WHERE dept NOT IN (
    SELECT dept
    FROM student
    GROUP BY dept
    ORDER BY AVG(marks) DESC
    LIMIT 1
);

--Q17. Find departments having more than 3 students (using subquery).
SELECT dept
FROM student
GROUP BY dept
HAVING COUNT(*) > 3;

--Q18. Find students whose marks are equal to department minimum marks.
SELECT *
FROM student s
WHERE marks = (
    SELECT MIN(marks)
    FROM student
    WHERE dept = s.dept
);

--Q19. Find students whose marks are below overall average.
SELECT *
FROM student
WHERE marks < (
    SELECT AVG(marks)
    FROM student
);

--Q20. Find total number of students using subquery.
SELECT COUNT(*)
FROM (
    SELECT id
    FROM student
) t;

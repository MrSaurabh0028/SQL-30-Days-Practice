----------------------------------DAY 9-----------------------------------
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

--SQL QUESTIONS FOR DATA ANALYST.

--Q1. Find the average marks of students department-wise.
SELECT dept, AVG(marks) AS avg_marks
FROM student
GROUP BY dept;

--Q2. Find students who scored more than the overall average marks.
SELECT *
FROM student
WHERE marks > (
    SELECT AVG(marks)
    FROM student
);

--Q3. Find the top scorer in each department.
SELECT *
FROM (
    SELECT name, dept, marks,
           RANK() OVER (PARTITION BY dept ORDER BY marks DESC) AS rnk
    FROM student
) t
WHERE rnk = 1;

--Q4. Count the number of students in each city.
SELECT city, COUNT(*) AS total_students
FROM student
GROUP BY city;

--Q5. Find departments where average marks are greater than 75.
SELECT dept
FROM student
GROUP BY dept
HAVING AVG(marks) > 75;

--Q6. Rank all students based on marks (highest first).
SELECT name, marks,
       RANK() OVER (ORDER BY marks DESC) AS rank_no
FROM student;

--Q7. Find students who scored below their department average.
SELECT *
FROM (
    SELECT name, dept, marks,
           AVG(marks) OVER (PARTITION BY dept) AS dept_avg
    FROM student
) t
WHERE marks < dept_avg;

--Q8. Find the second highest marks in the table.
SELECT MAX(marks) AS second_highest
FROM student
WHERE marks < (
    SELECT MAX(marks)
    FROM student
);

--Q9. Show cumulative (running) total of marks.
SELECT name, marks,
       SUM(marks) OVER (ORDER BY marks) AS running_total
FROM student;

--Q10. Find each student’s percentage contribution to total marks.
SELECT name, marks,
       ROUND(
         (marks * 100.0) / SUM(marks) OVER (), 2
       ) AS percentage_contribution
FROM student;
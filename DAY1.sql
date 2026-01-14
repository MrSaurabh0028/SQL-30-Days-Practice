----------------------------------DAY 1-----------------------------------
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


--Q1. Select all columns from Students table.
SELECT * FROM student;

--Q2. Sirf name aur marks display karo.
SELECT name,marks FROM student;

--Q3. Un students ko dikhaiye jinke marks 70 se upar hain.
SELECT name,marks FROM student
WHERE marks>=70;

--Q4. CS department ke students dikhaiye.
SELECT name,dept FROM student
WHERE dept='CS';

--Q5. Jinki city “Delhi” hai unka record nikaliye.
SELECT name,city FROM student
WHERE city='Delhi';

--Q6. Jinka name “S” se start hota hai.
SELECT name FROM student
WHERE name LIKE'S%';

--Q7. Marks 50 aur 90 ke beech wale students.
SELECT name,marks FROM student
WHERE marks BETWEEN 50 AND 90;

--Q8. CS ya IT department wale students.
SELECT name,Dept FROM student
WHERE dept='CS' OR dept='IT';

--Q9. Marks less than 60 wale students.
SELECT name,marks FROM student
WHERE marks<60;

--Q10. City Mumbai wale students ka sirf name.
SELECT name,city FROM student
WHERE city='Mumbai';

--Q11. Students ko marks ke descending order me dikhaiye.
SELECT name,marks FROM student
ORDER BY marks DESC;

--Q12. City Delhi aur marks > 80.
SELECT name,city,marks FROM student
WHERE city='Delhi' AND marks>'80';

--Q13. Dept CS nahi hai — unka list.
SELECT name,dept FROM student
WHERE NOT (dept='CS');

--Q14. Name me “a” letter ho — sab dikhaiye.
SELECT name FROM student
WHERE name LIKE'%A%';

--Q15. Top 3 highest marks wale students (ORDER BY + LIMIT).
SELECT name,marks FROM student
ORDER BY marks DESC
LIMIT 3;
--Q16. Distinct cities list koi.
SELECT DISTINCT city FROM student;

--Q17. Un students ko dikhaiye jinke marks sirf in values me se ho: 55, 73, 91.
--Hint: IN operator use karein.
SELECT name,marks FROM student
WHERE marks IN('55','73','91');

--Q18. Students jinka name exactly 5 letters ka ho — unka complete record dikhaiye.
--Hint: LIKE + underscore pattern.
SELECT *FROM student
WHERE name LIKE'_____';

--Q19. Students table me jinke marks NULL nahi hain — unka record nikaaliye.
--Hint: IS NOT NULL.
SELECT * FROM student
WHERE marks IS NOT NULL;
--Q20. Total students kitne hain — COUNT function ka use karke nikaaliye.
--Hint: COUNT(*) ya COUNT(id)
SELECT COUNT(name) as total_student
From student;

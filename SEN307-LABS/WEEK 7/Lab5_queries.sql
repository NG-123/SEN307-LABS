
-- Task 3 (worked example): every student and their courses,
-- including students with no enrolments
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: ____________ Matric: ____________
-- ============================================
USE sen307_2412387;
-- Task 1: Students in one department, sorted A-Z
-- Explanation: Joins Student to Department so I can filter by department name, then sorts by name.
SELECT s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: INNER JOIN keeps only courses that have an allocated lecturer. A course with two lecturers appears twice.
SELECT c.course_title, l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id;
-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: LEFT JOIN keeps every row from Student (the left table), even when there is
-- no matching enrolment. For those students, course_title comes back as NULL.

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Task 4: Filtering with AND / OR / IN / BETWEEN
-- Explanation: Female students in departments 1 or 3 born in 2004-2005.
SELECT full_name, gender, dept_id, date_of_birth
FROM Student
WHERE gender = 'F'
  AND dept_id IN (1, 3)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';
-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: without ORDER BY, SQL doesn't guarantee any row order, so the same query could return different rows each time, and pages could overlap or skip rows.
-- Page 1
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;
-- Page 2
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;
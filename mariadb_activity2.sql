-- Laboratory Activity 2: MariaDB Relationships and Queries
-- Run in terminal first:
-- sudo service mariadb start
-- sudo mariadb

USE school;
SHOW TABLES;

CREATE TABLE enrollments (
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE
);
DESCRIBE enrollments;

ALTER TABLE enrollments
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES students(id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

DESCRIBE enrollments;

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-10-07'),
(1, 2, '2026-10-07'),
(2, 1, '2026-10-07'),
(4, 3, '2026-10-07');
SELECT * FROM enrollments;

SELECT
students.name,
courses.course_name,
enrollments.enrollment_date
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id;

SELECT
students.name,
courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Web Development';

SELECT
students.name,
courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
ORDER BY students.name ASC;

SELECT
students.name,
courses.course_name
FROM enrollments
JOIN students
ON enrollments.student_id = students.id
JOIN courses
ON enrollments.course_id = courses.course_id
ORDER BY students.name DESC;

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

SELECT
courses.course_name,
COUNT(enrollments.student_id) AS number_of_students
FROM courses
LEFT JOIN enrollments
ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;

SELECT
    students.id AS student_id,
    students.name AS student_name,
    courses.course_name,
    enrollments.enrollment_date
FROM enrollments
JOIN students
    ON enrollments.student_id = students.id
JOIN courses
    ON enrollments.course_id = courses.course_id
ORDER BY students.name;

INSERT INTO students (name) VALUES
('Anne Guio'),
('Rye Lo'),
('Brody Salapong');

INSERT INTO courses (course_name) VALUES
('CIT4'),
('CIT5'),
('CIT3');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
((SELECT id FROM students WHERE name = 'Anne Guio'), (SELECT course_id FROM courses WHERE course_name = 'CIT3'), '2026-08-24'),
((SELECT id FROM students WHERE name = 'Anne Guio'), (SELECT course_id FROM courses WHERE course_name = 'CIT4'), '2026-08-24'),
((SELECT id FROM students WHERE name = 'Rye Lo'), (SELECT course_id FROM courses WHERE course_name = 'CIT4'), '2026-08-24'),
((SELECT id FROM students WHERE name = 'Rye Lo'), (SELECT course_id FROM courses WHERE course_name = 'CIT5'), '2026-08-25'),
((SELECT id FROM students WHERE name = 'Brody Salapong'), (SELECT course_id FROM courses WHERE course_name = 'CIT5'), '2026-08-25'),
((SELECT id FROM students WHERE name = 'Brody Salapong'), 1, '2026-08-25'),
(4, (SELECT course_id FROM courses WHERE course_name = 'CIT3'), '2026-08-26'),
(2, 3, '2026-08-26');

SELECT COUNT(*) AS total_students FROM students;
SELECT COUNT(*) AS total_courses FROM courses;
SELECT COUNT(*) AS total_enrollments FROM enrollments;


SELECT courses.course_name,
       COUNT(enrollments.student_id) AS number_of_students
FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name
ORDER BY number_of_students DESC
LIMIT 1;

SELECT id, name
FROM students
ORDER BY name;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;
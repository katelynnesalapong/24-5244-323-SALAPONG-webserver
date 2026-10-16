CREATE DATABASE school;
SHOW DATABASES;
USE school;
CREATE TABLE students (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(100),
    -> course VARCHAR(100),
    -> year_level INT
    -> );
SHOW TABLES;
DESCRIBE students;
INSERT INTO students (name, course, year_level)
    -> VALUES
    -> ('Juan Dela Cruz','BSIT', 1),
    -> ('Maria Santos','BSCS', 2),
    -> ('Pedro Reyes','BSIT', 3);
SELECT * FROM students;
 INSERT INTO students (name, course, year_level)
    -> VALUES ('Katelynne Salapong', 'BSIT', 1);
    SELECT * FROM students;
    
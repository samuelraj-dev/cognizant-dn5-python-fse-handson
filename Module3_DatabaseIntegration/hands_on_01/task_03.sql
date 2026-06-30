ALTER TABLE students
ADD COLUMN phone_number VARCHAR(15);

ALTER TABLE courses
ADD COLUMN max_seats INT DEFAULT 60;

ALTER TABLE enrollments
ADD CONSTRAINT chk_courses_grade CHECK (
    grade IS NULL OR
    grade IN ('A', 'B', 'C', 'D', 'F')
);

ALTER TABLE departments
RENAME hod_name TO head_of_dept;

ALTER TABLE students
DROP COLUMN phone_number;
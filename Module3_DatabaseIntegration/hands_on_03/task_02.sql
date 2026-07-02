CREATE OR REPLACE VIEW vw_student_enrollment_summary AS
SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    d.dept_name AS department,
    COUNT(e.enrollment_id) AS no_of_courses_enrolled,
    ROUND(AVG(
        CASE
            WHEN e.grade = 'A' THEN 4 
            WHEN e.grade = 'B' THEN 3
            WHEN e.grade = 'C' THEN 2
            WHEN e.grade = 'D' THEN 1
            WHEN e.grade = 'F' THEN 0
        END
    ), 2) AS gpa
FROM students s
LEFT JOIN departments d
ON s.department_id = d.department_id
LEFT JOIN enrollments e
ON e.student_id = s.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name,
    d.department_id, d.dept_name;




CREATE OR REPLACE VIEW vw_course_stats AS
SELECT
    c.course_name,
    c.course_code,
    COUNT(e.enrollment_id) AS total_enrollments,
    ROUND(AVG(
        CASE
            WHEN e.grade = 'A' THEN 4 
            WHEN e.grade = 'B' THEN 3
            WHEN e.grade = 'C' THEN 2
            WHEN e.grade = 'D' THEN 1
            WHEN e.grade = 'F' THEN 0
        END
    ), 2) AS avg_gpa
FROM courses c
LEFT JOIN enrollments e
ON e.course_id = c.course_id
GROUP BY
    c.course_id, c.course_name, c.course_code;




SELECT
    *
FROM vw_student_enrollment_summary
WHERE gpa > 3;




UPDATE vw_student_enrollment_summary
SET gpa = 2.00
WHERE full_name = 'Deepika Rao';
-- Multitable views are generally not updatable
-- because SQL cannot determine which base tables, which row and which column
-- as it contains Joins, Aggregations, and computed values. 




DROP VIEW IF EXISTS vw_student_enrollment_summary;
DROP VIEW IF EXISTS vw_course_stats;

CREATE VIEW vw_student_enrollment_summary AS
SELECT *
FROM students
WHERE enrollment_year >= 3
WITH CHECK OPTION; -- allows update/insert in students where enrollment_year >= 3
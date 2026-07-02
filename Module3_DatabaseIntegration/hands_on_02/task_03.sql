SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    d.dept_name AS department
FROM students s
JOIN departments d
ON s.department_id = d.department_id;

SELECT
    e.enrollment_id AS enrollment_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name AS course_name,
    e.enrollment_date AS enrollment_date,
    e.grade AS grade
FROM enrollments e
JOIN students s
ON s.student_id = e.student_id
JOIN courses c
ON c.course_id = e.course_id;

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    s.email,
    s.date_of_birth,
    s.department_id,
    s.enrollment_year
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS no_of_enrolled_students
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id;

SELECT
    d.dept_name,
    p.prof_name,
    p.salary
FROM departments d
LEFT JOIN professors p
ON p.department_id = d.department_id;
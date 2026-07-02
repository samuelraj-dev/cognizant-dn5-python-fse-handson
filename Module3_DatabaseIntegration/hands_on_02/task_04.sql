SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM enrollments e
JOIN courses c
ON c.course_id = e.course_id
GROUP BY c.course_id;

SELECT
    d.dept_name,
    ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
JOIN professors p
ON d.department_id = p.department_id
GROUP BY d.department_id;

SELECT
    d.department_id,
    d.dept_name,
    d.head_of_dept,
    d.budget
FROM departments d
WHERE d.budget > 600000;

SELECT
    c.course_name,
    e.grade,
    COUNT(e.grade)
FROM courses c
JOIN enrollments e
ON c.course_id = e.course_id
WHERE c.course_code = 'CS101'
GROUP BY e.grade, c.course_id;

SELECT
    d.dept_name,
    COUNT(DISTINCT s.first_name) AS no_of_enrolled_students
FROM departments d
JOIN students s
ON d.department_id = s.department_id
JOIN enrollments e
ON e.student_id = s.student_id
GROUP BY d.dept_name
HAVING COUNT(DISTINCT s.first_name) > 2;
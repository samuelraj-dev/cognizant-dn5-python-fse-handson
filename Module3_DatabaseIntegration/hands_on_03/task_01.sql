SELECT
    s.first_name,
    COUNT(e.enrollment_id) AS course_count
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name
HAVING COUNT(e.enrollment_id) > (
    SELECT
        AVG(t.course_count)
    FROM (
        SELECT
            s.student_id,
            COUNT(e.enrollment_id) AS course_count
        FROM students s
        LEFT JOIN enrollments e
            ON s.student_id = e.student_id
        GROUP BY s.student_id
    ) t 
);

SELECT
    c.course_name
FROM courses c
INNER JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING (
    SELECT COUNT(*)
    FROM enrollments es
    WHERE es.course_id = c.course_id AND es.grade <> 'A'
) = 0;
-- Using Exists
--
-- SELECT
--     c.course_name
-- FROM courses c
-- WHERE EXISTS (
--     SELECT 1
--     FROM enrollments e
--     WHERE e.course_id = c.course_id
-- )
-- AND NOT EXISTS (
--     SELECT 1
--     FROM enrollments e
--     WHERE e.course_id = c.course_id AND e.grade <> 'A'
-- );

SELECT
    p.department_id,
    p.prof_name,
    p.salary
FROM professors p
WHERE p.salary = (
    SELECT
        MAX(ps.salary)
    FROM professors ps
    WHERE ps.department_id = p.department_id
)
ORDER BY p.department_id;

SELECT
    d.dept_name,
    t.average_salary
FROM (
    SELECT
        ps.department_id,
        ROUND(AVG(ps.salary), 2) AS average_salary
    FROM professors ps
    GROUP BY ps.department_id
    HAVING AVG(ps.salary) > 85000
) t
JOIN departments d
ON t.department_id = d.department_id;
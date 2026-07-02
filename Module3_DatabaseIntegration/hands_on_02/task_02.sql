SELECT
    student_id,
    first_name,
    last_name,
    email,
    date_of_birth,
    department_id,
    enrollment_year
FROM students
WHERE enrollment_year = 2022
ORDER BY last_name ASC;

SELECT
    course_id,
    course_name,
    course_code,
    credits,
    department_id
FROM courses
WHERE credits > 3
ORDER BY credits DESC;

SELECT
    professor_id,
    prof_name,
    email,
    department_id,
    salary
FROM professors
WHERE SALARY BETWEEN 80000 AND 95000;

SELECT
    student_id,
    first_name,
    last_name,
    email,
    date_of_birth,
    department_id,
    enrollment_year
FROM students
WHERE email LIKE '%@college.edu';

SELECT
    enrollment_year,
    COUNT(*) AS no_of_students
FROM students
GROUP BY enrollment_year;
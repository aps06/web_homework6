SELECT evaluations.student, subjects.subject, subjects.teacher 
FROM evaluations
JOIN subjects ON evaluations.subject = subjects.subject
JOIN students ON evaluations.student = students.student
WHERE students.student = 'Janet Moore' AND subjects.teacher = 'Lori Martinez';
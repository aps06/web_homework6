SELECT evaluations.student, students.group_name, evaluations.subject, evaluations.rating
FROM evaluations
JOIN students ON evaluations.student = students.student
WHERE students.group_name = 'Group_2' AND evaluations.subject = 'Chemistry';
SELECT groups.group_name, subject, AVG(rating) AS avg_rating
FROM evaluations
JOIN students ON evaluations.student = students.student
JOIN groups ON students.group_name = groups.group_name
WHERE subject = 'History'
GROUP BY groups.group_name;
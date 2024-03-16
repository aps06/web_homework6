SELECT subjects.teacher, subjects.subject, AVG(evaluations.rating) AS avg_rating
FROM evaluations
JOIN subjects ON evaluations.subject = subjects.subject
WHERE subjects.teacher = 'Alexis Brown'
GROUP BY subjects.subject;
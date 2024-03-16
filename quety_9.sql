SELECT subjects.subject
FROM evaluations
JOIN subjects ON evaluations.subject = subjects.subject
WHERE evaluations.student = 'Jill Park'
GROUP BY subjects.subject;
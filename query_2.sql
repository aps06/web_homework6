SELECT student, subject,  AVG(rating) AS avg_rating
FROM evaluations
WHERE subject = 'Physics'
GROUP BY student
ORDER BY avg_rating DESC
LIMIT 1;
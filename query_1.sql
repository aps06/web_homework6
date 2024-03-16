SELECT student, AVG(rating) AS avg_rating
FROM evaluations
GROUP BY student
ORDER BY avg_rating DESC
LIMIT 5;
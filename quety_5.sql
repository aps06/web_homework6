SELECT subjects.teacher, subjects.subject
FROM subjects
JOIN teachers ON subjects.teacher = teachers.teacher
WHERE teachers.teacher = 'Lisa Kerr';
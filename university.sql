-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(120) NOT NULL
);

-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject VARCHAR(120) UNIQUE NOT NULL,
    teacher VARCHAR(120) UNIQUE NOT NULL,
    FOREIGN KEY (teacher) REFERENCES teachers (teacher)
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher VARCHAR(120) NOT NULL
);

-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student VARCHAR(120) NOT NULL,
    group_name VARCHAR(120),
    FOREIGN KEY (group_name) REFERENCES groups (group_name)
);

-- Table: evaluations
DROP TABLE IF EXISTS evaluations;
CREATE TABLE evaluations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student VARCHAR(120) NOT NULL,
    subject VARCHAR(120) NOT NULL,
    rating INTEGER NOT NULL,
    date_received DATE,
    FOREIGN KEY (subject) REFERENCES subjects (subject),
    FOREIGN KEY (student) REFERENCES students (student)
);
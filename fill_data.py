from datetime import datetime
import faker
from random import randint, choice
import sqlite3

GROUPS = [
    "Group_1",
    "Group_2",
    "Group_3",
]
SUBJECTS = [
    "Mathematics",
    "Physics",
    "Chemistry",
    "History",
    "Literature",
]
NUMBER_TEACHERS = 5
NUMBER_STUDENTS = 30


def generate_fake_data(number_teachers, number_students) -> tuple:

    fake_teachers = []
    fake_students = []

    fake_data = faker.Faker()

    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    return fake_teachers, fake_students


def prepare_data(groups, subjects, teachers, students) -> tuple:

    for_groups = []

    for group in groups:
        for_groups.append((group,))

    for_subjects = []

    for id, subject in enumerate(subjects):
        for_subjects.append((subject, teachers[id],))

    for_teachers = []

    for teacher in teachers:
        for_teachers.append((teacher,))

    for_students = []

    for student in students:
        for_students.append((student, choice(groups), ))

    for_evalutions = []

    for student in students:
        for subject in subjects:
            rating = randint(50, 100+1)
            date_received = datetime.now().date()
            for_evalutions.append((student, subject, rating, date_received,))

    return for_groups, for_subjects, for_teachers, for_students, for_evalutions


def insert_data_to_db(groups, subjects, teachers, students, evaluations) -> None:
    print(groups, subjects, teachers, students, evaluations)
    with sqlite3.connect("university.db") as con:

        cur = con.cursor()

        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""

        cur.executemany(sql_to_groups, groups)

        sql_to_subjects = """INSERT INTO subjects(subject, teacher)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_subjects, subjects)

        sql_to_teachers = """INSERT INTO teachers(teacher)
                              VALUES (?)"""

        cur.executemany(sql_to_teachers, teachers)

        sql_to_students = """INSERT INTO students(student, group_name)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_students, students)

        sql_to_evaluations = """INSERT INTO evaluations(student, subject, rating, date_received)
                               VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_evaluations, evaluations)

        con.commit()


if __name__ == "__main__":
    groups, subjects, teachers, students, evaluations = prepare_data(
        GROUPS, SUBJECTS, *generate_fake_data(NUMBER_TEACHERS, NUMBER_STUDENTS)
    )

    insert_data_to_db(groups, subjects, teachers, students, evaluations)

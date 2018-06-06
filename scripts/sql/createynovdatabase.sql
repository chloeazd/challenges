SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE
AND datname = 'ynov';

DROP DATABASE ynov;

CREATE DATABASE ynov;

\c ynov

CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
note_id INTEGER REFERENCES notes(note_id),
matiere INTEGER REFERENCES classes(matiere),
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL
);

CREATE TABLE classes (
classe_id SERIAL PRIMARY KEY,
matiere VARCHAR (50) UNIQUE NOT NULL,
teacher VARCHAR (355) NOT NULL
);

CREATE TABLE notes (
note_id SERIAL PRIMARY KEY,
coefficient INTEGER
);

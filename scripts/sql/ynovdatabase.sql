-- on ferme les connexions a la db shows
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE
AND datname = 'ynov';

-- on repars à zero
DROP DATABASE ynov;

-- creation de la base
CREATE DATABASE ynov;

-- on se connecte à la base show
\c ynov

-- creation des tables
CREATE TABLE students (
students_id SERIAL PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL
);


CREATE TABLE classes(
classes_id SERIAL PRIMARY KEY,
nommatiere VARCHAR(50) NOT NULL,
professeur VARCHAR(50) NOT NULL
);

CREATE TABLE notes(
notes_id SERIAL PRIMARY KEY,
note INT,
coefficient INT
);


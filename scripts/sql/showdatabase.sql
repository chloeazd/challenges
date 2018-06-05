SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE
AND datname = 'shows';

DROP DATABASE shows;

CREATE DATABASE shows;

\c shows

CREATE TABLE users (
user_id SERIAL PRIMARY KEY,
registration_timestamp TIMESTAMP,
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL,
email VARCHAR (355) UNIQUE NOT NULL,
password VARCHAR (50) NOT NULL
);

CREATE TABLE show (
show_id SERIAL PRIMARY KEY,
name VARCHAR (50) UNIQUE NOT NULL,
decription VARCHAR (355) NOT NULL,
release_year DATE,
genres VARCHAR (50) NOT NULL,
network VARCHAR (50) NOT NULL
);

CREATE TABLE episodes (
episode_id SERIAL PRIMARY KEY,
show_id INTEGER REFERENCES show(show_id),
season INTEGER,
number INTEGER,
timestamp TIMESTAMP
);


CREATE TABLE user_follow_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
follow_timestamp TIMESTAMP
);

CREATE TABLE user_rate_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
rating INTEGER,
rating_timestamp TIMESTAMP
);

CREATE TABLE user_watch_episode (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
follow_timestamp TIMESTAMP
);
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE
AND datname = 'shows';

DROP DATABASE shows;

CREATE DATABASE shows;

\c shows


CREATE TABLE users (
user_id SERIAL PRIMARY KEY,
registration_date DATE NOT NULL,
firstname VARCHAR (50) NOT NULL,
lastname VARCHAR (50) NOT NULL,
email VARCHAR (355) UNIQUE NOT NULL,
password VARCHAR (50) NOT NULL
);

CREATE TABLE show (
show_id SERIAL PRIMARY KEY,
name VARCHAR (50) UNIQUE NOT NULL,
decription TEXT,
release_year INT,
genres TEXT NOT NULL,
network VARCHAR (50) NOT NULL
);

CREATE TABLE episodes (
episode_id SERIAL PRIMARY KEY,
show_id INTEGER REFERENCES show(show_id),
season INT,
number INT,
date DATE
);


CREATE TABLE user_follow_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
follow_date DATE NOT NULL
);

CREATE TABLE user_rate_show (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
rating INT,
rating_date DATE NOT NULL
);

CREATE TABLE user_watch_episode (
user_id INTEGER REFERENCES users(user_id),
show_id INTEGER REFERENCES show(show_id),
follow_date DATE NOT NULL
);


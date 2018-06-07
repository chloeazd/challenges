-- on ferme les connexions a la db shows
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE 
  -- ne tue pas ma propre connexion
	pid <> pg_backend_pid()
	 -- ne tue pas les connections aux autre bdd
  AND datname = 'shows';

-- on repars à zero
DROP DATABASE shows;

-- creation de la base
CREATE DATABASE shows;

--on se connecte à la base show
\c shows


-- creation des tables
CREATE TABLE "users" (
  user_id           SERIAL PRIMARY KEY,
  registration_date DATE                   NOT NULL,
  firstname         VARCHAR(50)            NOT NULL,
  lastname          VARCHAR(50)            NOT NULL,
  email             VARCHAR(100) UNIQUE    NOT NULL   CHECK (email LIKE '%@%'),
  password          VARCHAR(50)            NOT NULL

);

CREATE TABLE "shows" (
  show_id      SERIAL PRIMARY KEY,
  name         VARCHAR(255) NOT NULL,
  description  TEXT,
  release_year INT         NOT NULL,
  genres       TEXT,
  network      TEXT

);

CREATE TABLE "episodes" (
  episode_id SERIAL,
  show_id    INTEGER REFERENCES shows (show_id),
  season     NUMERIC NOT NULL,
  number     NUMERIC NOT NULL,
  date       DATE,
  PRIMARY KEY (episode_id, show_id)
);



-- creation des tables de jointures 
CREATE TABLE "user_follow_episode" (
  user_id     INTEGER REFERENCES users (user_id),
  show_id     INTEGER REFERENCES shows (show_id),
  follow_date DATE NOT NULL
);

CREATE TABLE "user_rate_show" (
  user_id     INTEGER REFERENCES users (user_id),
  show_id     INTEGER REFERENCES shows (show_id),
  rating      NUMERIC NOT NULL,
  rating_date DATE    NOT NULL
);

CREATE TABLE "user_watch_episode" (
  user_id    INTEGER REFERENCES users (user_id),
  show_id    INTEGER REFERENCES shows (show_id),
  watch_date DATE NOT NULL

);

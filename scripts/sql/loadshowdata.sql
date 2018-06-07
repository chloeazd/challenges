
--modification de tables existants, on désactive tous les déclencheurs de chaque table 
ALTER TABLE "user_follow_episode" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "shows" DISABLE TRIGGER ALL;
ALTER TABLE "episodes" DISABLE TRIGGER ALL;
ALTER TABLE "users" DISABLE TRIGGER ALL;

-- On supprime toutes les données des tables sans supprimer les tables
TRUNCATE TABLE users CASCADE;
TRUNCATE TABLE shows CASCADE;
TRUNCATE TABLE episodes CASCADE;
TRUNCATE TABLE user_follow_episode CASCADE;
TRUNCATE TABLE user_rate_show CASCADE;
TRUNCATE TABLE user_watch_episode CASCADE;

-- Copie des données depuis fichiers CSV vers chaque table
COPY users(user_id,registration_date,firstname,lastname,email,password) FROM '/mtnt/c/workspace/mysql/scripts/csv/user.csv' DELIMITER ',' CSV HEADER;
COPY shows(show_id,name,description,release_year,genres,network) FROM '/mtnt/c/workspace/mysql/scripts/csv/show.csv' DELIMITER ',' CSV HEADER;
COPY episodes(episode_id,show_id,season,number,date) FROM '/mtnt/c/workspace/mysql/scripts/csv/episode.csv' DELIMITER ',' CSV HEADER;
COPY user_follow_episode(user_id,show_id,follow_date) FROM '/mtnt/c/workspace/mysql/scripts/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;
COPY user_rate_show(user_id,show_id,rating,rating_date) FROM '/mtnt/c/workspace/mysql/scripts/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;
COPY user_watch_episode(user_id,show_id,watch_date) FROM '/mtnt/c/workspace/mysql/scripts/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;

--modification de tables existants, on réactive tous les déclencheurs de chaque table 
ALTER TABLE "user_follow_episode" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "shows" ENABLE TRIGGER ALL;
ALTER TABLE "episodes" ENABLE TRIGGER ALL;
ALTER TABLE "users" ENABLE TRIGGER ALL;

ALTER TABLE "user_follow_episode" DISABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" DISABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" DISABLE TRIGGER ALL;
ALTER TABLE "show" DISABLE TRIGGER ALL;
ALTER TABLE "episodes" DISABLE TRIGGER ALL;
ALTER TABLE "users" DISABLE TRIGGER ALL;

TRUNCATE TABLE users CASCADE;
TRUNCATE TABLE episodes CASCADE;
TRUNCATE TABLE show CASCADE;
TRUNCATE TABLE user_follow_show CASCADE;
TRUNCATE TABLE user_rate_show CASCADE;
TRUNCATE TABLE user_watch_episode CASCADE;


COPY users(user_id,registration_date,firstname,lastname,email,password) FROM '/mnt/d/scriptpostgre/4_database/csv/user.csv' DELIMITER ',' CSV HEADER;
COPY episodes(episode_id,show_id,season,number,date) FROM '/mnt/d/scriptpostgre/4_database/csv/episodes.csv' DELIMITER ',' CSV HEADER;
COPY show(show_id,name,description,release_year,genres,network) FROM '/mnt/d/scriptpostgre/4_database/csv/show.csv' DELIMITER ',' CSV HEADER;
COPY user_follow_show(user_id,show_id,follow_date) FROM '/mnt/d/scriptpostgre/4_database/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;
COPY user_rate_show(user_id,show_id,rating,rating_date) FROM '/mnt/d/scriptpostgre/4_database/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;
COPY user_watch_episode(user_id,episode_id,watch_date) FROM '/mnt/d/scriptpostgre/4_database/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;


ALTER TABLE "user_follow_episode" ENABLE TRIGGER ALL;
ALTER TABLE "user_watch_episode" ENABLE TRIGGER ALL;
ALTER TABLE "user_rate_show" ENABLE TRIGGER ALL;
ALTER TABLE "show" ENABLE TRIGGER ALL;
ALTER TABLE "episodes" ENABLE TRIGGER ALL;
ALTER TABLE "users" ENABLE TRIGGER ALL;
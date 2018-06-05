TRUNCATE TABLE users CASCADE;
TRUNCATE TABLE episodes CASCADE;
TRUNCATE TABLE show CASCADE;
TRUNCATE TABLE user_follow_show CASCADE;
TRUNCATE TABLE user_rate_show CASCADE;
TRUNCATE TABLE user_watch_episode CASCADE;

COPY users(user_id,registration_timestamp,firstname,lastname,email,password) FROM '/mnt/c/workspace/mysql/scripts/csv/user.csv' DELIMITER ',' CSV HEADER;
COPY episodes(episode_id,show_id,season,number,timestamp) FROM '/mnt/c/workspace/mysql/scripts/csv/episode.csv' DELIMITER ',' CSV HEADER;
COPY show(show_id,name,description,release_year,genres,network) FROM '/mnt/c/workspace/mysql/scripts/csv/show.csv' DELIMITER ',' CSV HEADER;
COPY user_follow_show(user_id,show_id,follow_timestamp) FROM '/mnt/c/workspace/mysql/scripts/csv/user_follow_show.csv' DELIMITER ',' CSV HEADER;
COPY user_rate_show(user_id,show_id,rating,rating_timestamp) FROM '/mnt/c/workspace/mysql/scripts/csv/user_rate_show.csv' DELIMITER ',' CSV HEADER;
COPY user_watch_episode(user_id,episode_id,watch_timestamp) FROM '/mnt/c/workspace/mysql/scripts/csv/user_watch_episode.csv' DELIMITER ',' CSV HEADER;

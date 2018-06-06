CREATE EXTENSION pgcrypto;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL
);

INSERT INTO users (email, password) VALUES (
  'johndoe@mail.com',
  crypt('johnspassword', gen_salt('bf'))
);

update users set password=crypt(password,gen_salt('bf'));

SELECT * FROM users WHERE password = crypt('adaliquid667', password);



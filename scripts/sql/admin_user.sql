-- Creation du superuser admin avec son password
CREATE ROLE admin LOGIN PASSWORD 'adminpassword' SUPERUSER;
-- Creation de la base de données admin contenant l'admin
CREATE DATABASE admin OWNER = admin;

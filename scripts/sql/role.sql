REVOKE ALL PRIVILEGES ON shows FROM readonly;
REVOKE readonly FROM readuser;
DROP ROLE  readonly;
DROP USER readuser;

CREATE ROLE readonly;

GRANT USAGE ON SCHEMA shows TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA shows TO readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;

CREATE ROLE readuser;
GRANT readonly TO readuser;







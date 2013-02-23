\o '/dev/null'
\set QUIET on
\set ON_ERROR_ROLLBACK on
\set ON_ERROR_STOP on

SET CLIENT_MIN_MESSAGES = ERROR;

BEGIN;

\echo
\echo 'Reinstall..'


\echo
\echo 'Remove pgunit'
DROP SCHEMA IF EXISTS pgunit CASCADE;

\i 'install.sql'
\o '/dev/null'
\set QUIET on
\set ON_ERROR_ROLLBACK on
\set ON_ERROR_STOP on

SET CLIENT_MIN_MESSAGES = ERROR;

BEGIN;

CREATE SCHEMA pgunit;

\echo
\echo 'Install pgunit'
\echo

\echo 'Creating assert_array_equals...'
\i 'assert_array_equals.sp.sql'

\echo 'Creating assert_equals...'
\i 'assert_equals.sp.sql'

\echo 'Creating test_assert_array_equals...'
\i 'assert_false.sp.sql'

\echo 'Creating assert_not_equals...'
\i 'assert_not_equals.sp.sql'

\echo 'Creating assert_not_null...'
\i 'assert_not_null.sp.sql'

\echo 'Creating assert_null...'
\i 'assert_null.sp.sql'

\echo 'Creating assert_true...'
\i 'assert_true.sp.sql'

\echo 'Creating fail...'
\i 'fail.sp.sql'

\echo 'Creating run_test...'
\i 'run_test.sp.sql'

\cd test

\i install.sql

\cd ..

\i './test/selftest.sql'

COMMIT;

\echo
\echo 'Installation complete.'
\echo






















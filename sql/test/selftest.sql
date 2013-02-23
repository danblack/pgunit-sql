\echo
\echo 'Run self tests'
\echo

\echo 'Run test_assert_array_equals'
SELECT pgunit.test_assert_array_equals();

\echo 'Run test_assert_equals'
SELECT pgunit.test_assert_equals();

\echo 'Run test_assert_false'
SELECT pgunit.test_assert_false();

\echo 'Run test_assert_not_null'
SELECT pgunit.test_assert_not_null();

\echo 'Run test_assert_null'
SELECT pgunit.test_assert_null();

\echo 'Run test_assert_true'
SELECT pgunit.test_assert_true();

\echo 'Run test_fail'
SELECT pgunit.test_fail();



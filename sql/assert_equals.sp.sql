CREATE OR REPLACE FUNCTION pgunit.assert_equals(
  IN _expected anyelement,
  IN _actual anyelement,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF _expected IS NULL THEN
    RAISE EXCEPTION '#incorrect_expected_value NULL';
  END IF;
  IF _expected IS DISTINCT FROM _actual THEN
    RAISE EXCEPTION E'#assert_equals\n%\nExpected: %\nActual: %', _message, _expected, _actual;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

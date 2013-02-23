CREATE OR REPLACE FUNCTION pgunit.assert_array_equals(
  IN _expected anyelement,
  IN _actual anyelement,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF _expected IS NULL THEN
    RAISE EXCEPTION '#incorrect_expected_value NULL';
  END IF;
  IF NOT (_expected::varchar[] @> _actual::varchar[] AND _actual::varchar[] @> _expected::varchar[])
     OR _actual IS NULL
     OR (array_dims(_expected) <> array_dims(_actual))
  THEN
    RAISE EXCEPTION E'#assert_array_equals\n%\nExpected: %\nActual: %', _message, _expected, _actual;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;
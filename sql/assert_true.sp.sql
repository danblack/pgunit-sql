CREATE OR REPLACE FUNCTION pgunit.assert_true(
  IN _value boolean,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF NOT _value OR _value IS NULL THEN
    RAISE EXCEPTION E'#assert_true\n%\nValue: %', _message, _value;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION pgunit.assert_false(
  IN _value boolean,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF _value OR _value IS NULL THEN
    RAISE EXCEPTION E'#assert_false\n%\nValue: %', _message, _value;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;
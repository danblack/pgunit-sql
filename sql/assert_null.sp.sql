CREATE OR REPLACE FUNCTION pgunit.assert_null(
  IN _value anyelement,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF _value IS NOT NULL THEN
    RAISE EXCEPTION E'#assert_null\n%\nValue: %', _message, _value;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;
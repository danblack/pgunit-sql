CREATE OR REPLACE FUNCTION pgunit.assert_not_null(
  IN _value anyelement,
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  IF _value IS NULL THEN
    RAISE EXCEPTION E'#assert_not_null\n%', _message;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;
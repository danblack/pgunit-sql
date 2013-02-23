CREATE OR REPLACE FUNCTION pgunit.fail(
  IN _message varchar
) RETURNS void AS
$BODY$
BEGIN
  RAISE EXCEPTION E'#fail\n%', _message;
END;
$BODY$
LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION pgunit.run_test(
  IN _sp varchar
) RETURNS character varying
AS
$BODY$
BEGIN
  EXECUTE 'SELECT ' || _sp;
  RAISE EXCEPTION '#OK';
EXCEPTION
  WHEN others THEN
    RETURN SQLERRM;
END;
$BODY$
LANGUAGE plpgsql;
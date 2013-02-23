CREATE OR REPLACE FUNCTION pgunit.log_query(
  IN _query text
) RETURNS boolean AS
$BODY$
DECLARE
  _record record;
  _i integer := 0;
BEGIN
  FOR _record IN EXECUTE _query
  LOOP
    _i := _i + 1;
    RAISE LOG '#% %', _i, _record;
  END LOOP;
  RETURN True;
END
$BODY$
LANGUAGE plpgsql;

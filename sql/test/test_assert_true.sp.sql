CREATE OR REPLACE FUNCTION pgunit.test_assert_true() RETURNS void AS
$BODY$
DECLARE
  _message  varchar;
BEGIN
  _message := 'qazwsxedc';

  PERFORM pgunit.assert_true(True, _message);

  BEGIN
    PERFORM pgunit.assert_true(False, _message);
    RAISE EXCEPTION 'Epic fail. Line: 16';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_true\n%' THEN
        RAISE;
      END IF;
  END;

  BEGIN
    PERFORM pgunit.assert_true(NULL::boolean, _message);
    RAISE EXCEPTION 'Epic fail. Line: 26';
  EXCEPTION
    WHEN others THEN
      IF SQLERRM NOT ILIKE E'#assert_true\n%' THEN
        RAISE;
      END IF;
  END;
END;
$BODY$
LANGUAGE plpgsql VOLATILE;
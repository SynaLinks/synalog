-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ab' AS last
   UNION ALL
  
    SELECT
      2 AS id,
      'AB' AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id
FROM
  t_0_C AS C
WHERE
  (COALESCE(UPPER(C.last), '') = COALESCE(C.last, '') AND (UPPER(C.last) IS NULL) = (C.last IS NULL));
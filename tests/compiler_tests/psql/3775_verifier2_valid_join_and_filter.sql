-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.a AS a,
  t_0_E.b AS c
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (COALESCE(t_0_E.a, 0) = COALESCE(E.b, 0) AND (t_0_E.a IS NULL) = (E.b IS NULL));
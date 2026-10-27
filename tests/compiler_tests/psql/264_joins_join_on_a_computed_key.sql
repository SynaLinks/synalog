-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      5 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.k AS b
FROM
  t_2_B AS t_1_B
WHERE
  (COALESCE(t_1_B.k, 0) = COALESCE(((1) + (1)), 0) AND (t_1_B.k IS NULL) = (((1) + (1)) IS NULL));
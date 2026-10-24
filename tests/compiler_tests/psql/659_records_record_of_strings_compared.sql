-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord18411727047540378482') then create type synalogrecord18411727047540378482 as ("k" text, "v" text); end if; END $$;
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      ROW('a', 'x')::synalogrecord18411727047540378482 AS r
   UNION ALL
  
    SELECT
      ROW('b', 'y')::synalogrecord18411727047540378482 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (t_0_V.r).v AS v
FROM
  t_1_V AS t_0_V
WHERE
  ((t_0_V.r).k = 'b');
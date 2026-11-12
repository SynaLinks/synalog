-- Initializing PostgreSQL environment.
set client_min_messages to warning;
DO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'a' AS "group",
      1 AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'b' AS "group",
      2 AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line."order" AS "order",
  Line."group" AS "group",
  SUM(Line."select") AS total
FROM
  t_0_Line AS Line
GROUP BY Line."order", Line."group" ORDER BY "order" DESC;
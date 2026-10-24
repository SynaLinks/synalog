-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Synalog type: synalogrecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord481217614') then create type synalogrecord481217614 as (r synalogrecord893574736); end if;
-- Synalog type: synalogrecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord86796764') then create type synalogrecord86796764 as (s text); end if;
END $$;
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS g,
      'cat' AS s
   UNION ALL
  
    SELECT
      1 AS g,
      'ant' AS s
   UNION ALL
  
    SELECT
      2 AS g,
      'bee' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  MIN(V.s) AS m
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;
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
WITH t_0_Words AS (SELECT * FROM (
  
    SELECT
      'apple' AS word
   UNION ALL
  
    SELECT
      'banana' AS word
   UNION ALL
  
    SELECT
      'cherry' AS word
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CAST((SELECT
  MAX((CASE WHEN x_6 = 0 THEN Words.word ELSE NULL END)) AS synalog_value
FROM
  t_0_Words AS Words, UNNEST(ARRAY[0]::numeric[]) as x_6) AS text) AS longest ORDER BY longest;
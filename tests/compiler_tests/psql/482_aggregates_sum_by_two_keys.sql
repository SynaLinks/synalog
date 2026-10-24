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
      'a' AS g,
      1 AS h,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      1 AS h,
      2 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS h,
      4 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS h,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.h AS h,
  SUM(V.x) AS t
FROM
  t_0_V AS V
GROUP BY V.g, V.h ORDER BY g, h;
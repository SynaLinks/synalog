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
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      'a' AS g,
      '2024-05-01' AS d
   UNION ALL
  
    SELECT
      'b' AS g,
      '2023-01-01' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  MAX(V.d) AS d
FROM
  t_0_V AS V
GROUP BY V.g ORDER BY g;
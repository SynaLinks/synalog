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
-- Synalog type: synalogrecord399476892
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord399476892') then create type synalogrecord399476892 as (n text, v numeric); end if;
END $$;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[ROW('a', 1)::synalogrecord399476892, ROW('b', 2)::synalogrecord399476892]::synalogrecord399476892[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[ROW('c', 3)::synalogrecord399476892]::synalogrecord399476892[] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  ((T.l)[0 + 1]).n AS n
FROM
  t_0_T AS T ORDER BY k;
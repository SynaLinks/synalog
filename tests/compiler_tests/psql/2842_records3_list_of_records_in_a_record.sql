-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord4731752025327218895') then create type synalogrecord4731752025327218895 as ("v" numeric); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord13991917428173920417') then create type synalogrecord13991917428173920417 as ("name" text, "xs" synalogrecord4731752025327218895[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      ROW('a', ARRAY[ROW(1)::synalogrecord4731752025327218895, ROW(2)::synalogrecord4731752025327218895])::synalogrecord13991917428173920417 AS r
   UNION ALL
  
    SELECT
      ROW('b', ARRAY[ROW(5)::synalogrecord4731752025327218895])::synalogrecord13991917428173920417 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (t_0_R.r).name AS name,
  (x_1).v AS v
FROM
  t_1_R AS t_0_R, LATERAL (SELECT UNNEST((t_0_R.r).xs) AS x_1) AS pushkin_x_1 ORDER BY name, v;
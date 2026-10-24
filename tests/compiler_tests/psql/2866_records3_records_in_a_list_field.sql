-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord1627638053154733253') then create type synalogrecord1627638053154733253 as ("n" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord12186761575366061407') then create type synalogrecord12186761575366061407 as ("items" synalogrecord1627638053154733253[], "name" text); end if; END $$;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      ROW(ARRAY[ROW('p')::synalogrecord1627638053154733253, ROW('q')::synalogrecord1627638053154733253], 'a')::synalogrecord12186761575366061407 AS r
   UNION ALL
  
    SELECT
      ROW(ARRAY[ROW('r')::synalogrecord1627638053154733253], 'b')::synalogrecord12186761575366061407 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (T.r).name AS name,
  (x_1).n AS item
FROM
  t_0_T AS T, LATERAL (SELECT UNNEST((T.r).items) AS x_1) AS pushkin_x_1 ORDER BY name, item;
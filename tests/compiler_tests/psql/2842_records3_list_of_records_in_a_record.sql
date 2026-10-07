-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord4731752025327218895') then create type logicarecord4731752025327218895 as ("v" numeric); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord10173126887784730510') then create type logicarecord10173126887784730510 as ("name" text, "xs" logicarecord4731752025327218895[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      ROW('a', ARRAY[ROW(1)::logicarecord4731752025327218895, ROW(2)::logicarecord4731752025327218895])::logicarecord10173126887784730510 AS r
   UNION ALL
  
    SELECT
      ROW('b', ARRAY[ROW(5)::logicarecord4731752025327218895])::logicarecord10173126887784730510 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (t_0_R.r).name AS name,
  (x_1).v AS v
FROM
  t_1_R AS t_0_R, LATERAL (SELECT UNNEST((t_0_R.r).xs) AS x_1) AS pushkin_x_1 ORDER BY name, v;
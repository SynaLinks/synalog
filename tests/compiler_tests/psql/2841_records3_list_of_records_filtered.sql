-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18303469541312490344') then create type logicarecord18303469541312490344 as ("n" text, "v" numeric); end if; END $$;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[ROW('a', 1)::logicarecord18303469541312490344, ROW('b', 2)::logicarecord18303469541312490344] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[ROW('c', 3)::logicarecord18303469541312490344] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (x_1).n AS n
FROM
  t_0_T AS T, LATERAL (SELECT UNNEST(T.l) AS x_1) AS pushkin_x_1
WHERE
  ((x_1).v > 1) ORDER BY n;
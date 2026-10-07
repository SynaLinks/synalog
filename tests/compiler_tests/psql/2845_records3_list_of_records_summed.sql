-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18303469541312490344') then create type logicarecord18303469541312490344 as ("n" text, "v" numeric); end if; END $$;
WITH t_1_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[ROW('a', 1)::logicarecord18303469541312490344, ROW('b', 2)::logicarecord18303469541312490344] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[ROW('c', 3)::logicarecord18303469541312490344] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_T.k AS k,
  SUM((x_3).v) AS t
FROM
  t_1_T AS t_0_T, LATERAL (SELECT UNNEST(t_0_T.l) AS x_3) AS pushkin_x_3
GROUP BY t_0_T.k ORDER BY k;
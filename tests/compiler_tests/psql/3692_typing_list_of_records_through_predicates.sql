-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18303469541312490344') then create type logicarecord18303469541312490344 as ("n" text, "v" numeric); end if; END $$;
WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(ROW(t_2_V.n, t_2_V.v)::logicarecord18303469541312490344) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  (x_1).n AS n,
  (x_1).v AS v
FROM
  t_1_L AS t_0_L, LATERAL (SELECT UNNEST(t_0_L.l) AS x_1) AS pushkin_x_1 ORDER BY n;
-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord18190930258757385564') then create type logicarecord18190930258757385564 as ("n" numeric); end if; END $$;
WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS n
   UNION ALL
  
    SELECT
      'x' AS g,
      2 AS n
   UNION ALL
  
    SELECT
      'y' AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(ROW(V.n)::logicarecord18190930258757385564) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, LATERAL (SELECT UNNEST(t_0_C.l) AS x_3) AS pushkin_x_3
WHERE
  ((x_3).n > 0)
GROUP BY t_0_C.g ORDER BY g;
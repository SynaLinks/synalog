-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1627638053154733253') then create type logicarecord1627638053154733253 as ("n" text); end if; END $$;
WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG(ROW(V.n)::logicarecord1627638053154733253 order by V.k) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  ARRAY_AGG(((t_4_L.l)[x_12 + 1]).n order by x_12) AS s
FROM
  t_5_L AS t_4_L, UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, CARDINALITY(t_4_L.l) - 1) as x), '{}')) as x_12)
SELECT
  ARRAY_TO_STRING(J.s, '-') AS s
FROM
  t_0_J AS J;
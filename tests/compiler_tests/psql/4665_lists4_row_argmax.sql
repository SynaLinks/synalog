-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord15014184063026700746') then create type logicarecord15014184063026700746 as ("arg" numeric, "value" numeric); end if; END $$;
WITH t_2_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST('{}' AS numeric[]) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      ARRAY[5, 5, 9, 1] AS l
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(null AS numeric[]) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  (ARRAY_AGG(((CASE WHEN x_8 = 0 THEN ROW(x_7, (t_0_L.l)[x_7 + 1])::logicarecord15014184063026700746 ELSE NULL END)).arg order by ((CASE WHEN x_8 = 0 THEN ROW(x_7, (t_0_L.l)[x_7 + 1])::logicarecord15014184063026700746 ELSE NULL END)).value desc nulls last))[1] AS logica_value
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, CARDINALITY(t_0_L.l) - 1) as x), '{}')) as x_7, UNNEST(ARRAY[0]) as x_8) AS v
FROM
  t_2_L AS t_0_L ORDER BY k;
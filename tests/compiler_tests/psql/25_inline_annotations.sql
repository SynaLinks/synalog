-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_P1 AS (SELECT
  (MOD(CAST(((x_2) * (17)) AS numeric), NULLIF(CAST(39 AS numeric), 0))) AS col0
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_2 ORDER BY col0),
t_0_P2 AS (SELECT
  x_5 AS col0
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_5 LIMIT 5),
t_0_P3 AS (SELECT
  x_5 AS col0
FROM
  UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x), '{}')) as x_5
WHERE
  ((MOD(CAST(x_5 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'ordered' AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      'limited' AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      'both' AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;
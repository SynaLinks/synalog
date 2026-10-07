-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) * (x_15)) AS sq,
      'even' AS type
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_15
    WHERE
      ((MOD(CAST(x_15 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 0)
   UNION ALL
  
    SELECT
      x_25 AS x,
      ((x_25) * (x_25)) AS sq,
      'odd' AS type
    FROM
      UNNEST(COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x), '{}')) as x_25
    WHERE
      ((MOD(CAST(x_25 AS numeric), NULLIF(CAST(2 AS numeric), 0))) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;
-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) * (x_15)) AS sq,
      'even' AS type
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_15
    WHERE
      ((MOD(x_15, 2)) = 0)
   UNION ALL
  
    SELECT
      x_25 AS x,
      ((x_25) * (x_25)) AS sq,
      'odd' AS type
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_25
    WHERE
      ((MOD(x_25, 2)) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;
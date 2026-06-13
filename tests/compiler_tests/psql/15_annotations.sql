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
WITH t_0_Sorted AS (SELECT
  x_5 AS col0
FROM
  UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x)) as x_5
WHERE
  ((MOD(x_5, 2)) = 0) ORDER BY col0),
t_0_Top5 AS (SELECT
  x_5 AS col0
FROM
  UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x)) as x_5 ORDER BY col0 LIMIT 5),
t_0_TopEven AS (SELECT
  x_5 AS col0
FROM
  UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 20 - 1) as x)) as x_5
WHERE
  ((MOD(x_5, 2)) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'sorted' AS col0,
      Sorted.col0 AS col1
    FROM
      t_0_Sorted AS Sorted
   UNION ALL
  
    SELECT
      'top5' AS col0,
      Top5.col0 AS col1
    FROM
      t_0_Top5 AS Top5
   UNION ALL
  
    SELECT
      'top_even' AS col0,
      TopEven.col0 AS col1
    FROM
      t_0_TopEven AS TopEven
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;
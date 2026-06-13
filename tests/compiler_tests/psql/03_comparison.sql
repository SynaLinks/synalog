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
SELECT * FROM (
  
    SELECT
      'equal' AS test_name,
      5 AS x
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_5
    WHERE
      (5 = x_5)
   UNION ALL
  
    SELECT
      'not_equal' AS test_name,
      x_5 AS x
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_5
    WHERE
      (x_5 != 5)
   UNION ALL
  
    SELECT
      'less_than' AS test_name,
      x_5 AS x
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_5
    WHERE
      (x_5 < 5)
   UNION ALL
  
    SELECT
      'in_range' AS test_name,
      x_5 AS x
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_5
    WHERE
      (x_5 >= 3) AND
      (x_5 <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;
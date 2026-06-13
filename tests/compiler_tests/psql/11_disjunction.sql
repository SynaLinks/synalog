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
WITH t_0_Classification AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0,
      'small' AS col1
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_8
    WHERE
      (x_8 < 3)
   UNION ALL
  
    SELECT
      x_13 AS col0,
      'medium' AS col1
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_13
    WHERE
      (x_13 >= 3) AND
      (x_13 < 7)
   UNION ALL
  
    SELECT
      x_18 AS col0,
      'large' AS col1
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 10 - 1) as x)) as x_18
    WHERE
      (x_18 >= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 )
SELECT
  Classification.col0 AS col0,
  Classification.col1 AS col1
FROM
  t_0_Classification AS Classification ORDER BY col0;
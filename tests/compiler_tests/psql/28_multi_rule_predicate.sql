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
WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0
    FROM
      UNNEST((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, 5 - 1) as x)) as x_8
   UNION ALL
  
    SELECT
      x_10 AS col0
    FROM
      UNNEST(ARRAY[10, 11, 12, 13, 14]::numeric[]) as x_10
  
) AS UNUSED_TABLE_NAME  ),
t_0_Category AS (SELECT * FROM (
  
    SELECT
      Number.col0 AS col0,
      'small' AS col1
    FROM
      t_1_Number AS Number
    WHERE
      (Number.col0 < 5)
   UNION ALL
  
    SELECT
      t_2_Number.col0 AS col0,
      'medium' AS col1
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (t_2_Number.col0 >= 5) AND
      (t_2_Number.col0 < 10)
   UNION ALL
  
    SELECT
      t_3_Number.col0 AS col0,
      'large' AS col1
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (t_3_Number.col0 >= 10)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Category.col0 AS col0,
  Category.col1 AS col1
FROM
  t_0_Category AS Category ORDER BY col0;
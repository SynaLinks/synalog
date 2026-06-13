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
WITH t_1_Products AS (SELECT * FROM (
  
    SELECT
      'laptop' AS col0,
      1000 AS col1,
      'electronics' AS col2
   UNION ALL
  
    SELECT
      'phone' AS col0,
      500 AS col1,
      'electronics' AS col2
   UNION ALL
  
    SELECT
      'book' AS col0,
      20 AS col1,
      'media' AS col2
   UNION ALL
  
    SELECT
      'headphones' AS col0,
      150 AS col1,
      'electronics' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_SpecialProducts AS (SELECT * FROM (
  
    SELECT
      Products.col0 AS col0,
      'expensive' AS col1
    FROM
      t_1_Products AS Products
    WHERE
      (Products.col1 > 800)
   UNION ALL
  
    SELECT
      t_2_Products.col0 AS col0,
      'media_item' AS col1
    FROM
      t_1_Products AS t_2_Products
    WHERE
      (t_2_Products.col2 = 'media')
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SpecialProducts.col0 AS name,
  SpecialProducts.col1 AS reason
FROM
  t_0_SpecialProducts AS SpecialProducts
GROUP BY SpecialProducts.col0, SpecialProducts.col1 ORDER BY name;
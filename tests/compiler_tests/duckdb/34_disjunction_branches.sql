-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Products AS (SELECT * FROM (
  
    SELECT
      E'laptop' AS col0,
      1000 AS col1,
      E'electronics' AS col2
   UNION ALL
  
    SELECT
      E'phone' AS col0,
      500 AS col1,
      E'electronics' AS col2
   UNION ALL
  
    SELECT
      E'book' AS col0,
      20 AS col1,
      E'media' AS col2
   UNION ALL
  
    SELECT
      E'headphones' AS col0,
      150 AS col1,
      E'electronics' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_SpecialProducts AS (SELECT * FROM (
  
    SELECT
      Products.col0 AS col0,
      E'expensive' AS col1
    FROM
      t_1_Products AS Products
    WHERE
      (Products.col1 > 800)
   UNION ALL
  
    SELECT
      t_2_Products.col0 AS col0,
      E'media_item' AS col1
    FROM
      t_1_Products AS t_2_Products
    WHERE
      (t_2_Products.col2 = E'media')
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SpecialProducts.col0 AS name,
  SpecialProducts.col1 AS reason
FROM
  t_0_SpecialProducts AS SpecialProducts
GROUP BY SpecialProducts.col0, SpecialProducts.col1 ORDER BY name;
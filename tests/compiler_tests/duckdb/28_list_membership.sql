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
WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      1.50 AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      0.75 AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      0.50 AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      2.00 AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      1.25 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, (select unnest(['fruit', 'vegetable']::text[]) as unnested_pod) as x_9
WHERE
  (Items.col1 = x_9.unnested_pod) ORDER BY name;
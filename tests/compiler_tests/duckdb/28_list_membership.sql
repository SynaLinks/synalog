-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      1.50E0 AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      0.75E0 AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      0.50E0 AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      2.00E0 AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      1.25E0 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, (select unnest(['fruit', 'vegetable']) as unnested_pod) as x_9
WHERE
  (Items.col1 = x_9.unnested_pod) ORDER BY name;
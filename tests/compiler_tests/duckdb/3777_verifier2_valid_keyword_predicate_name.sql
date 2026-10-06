-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_Order AS (SELECT
  t_2_N.n AS n
FROM
  t_3_N AS t_2_N ORDER BY n)
SELECT
  t_0_Order.n AS n
FROM
  t_1_Order AS t_0_Order
WHERE
  (t_0_Order.n > 2);
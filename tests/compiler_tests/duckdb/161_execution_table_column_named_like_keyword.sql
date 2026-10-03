-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'paid' AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'open' AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line."order" AS "order"
FROM
  t_0_Line AS Line
WHERE
  (Line."select" = 'paid');
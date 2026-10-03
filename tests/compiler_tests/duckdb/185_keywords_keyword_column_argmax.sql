-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      5 AS s
   UNION ALL
  
    SELECT
      2 AS "order",
      9 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argmax(S."order", S.s) AS "order"
FROM
  t_1_S AS S;
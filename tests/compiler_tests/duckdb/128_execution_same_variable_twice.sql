-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      2 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Edge.x AS x
FROM
  t_0_Edge AS Edge
WHERE
  (Edge.y IS NOT DISTINCT FROM Edge.x);
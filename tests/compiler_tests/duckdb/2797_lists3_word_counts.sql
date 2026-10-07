-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2.unnested_pod AS w,
  SUM(1) AS n
FROM
  t_1_W AS t_0_W, (select unnest(SPLIT(t_0_W.s, ' ')) as unnested_pod) as x_2
WHERE
  (x_2.unnested_pod != '')
GROUP BY x_2.unnested_pod ORDER BY w, n;
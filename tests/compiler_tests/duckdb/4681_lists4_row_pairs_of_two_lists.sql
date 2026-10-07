-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      [7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      [5, 5, 9, 1] AS l
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  SUM((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  (select unnest(t_0_L.l) as unnested_pod) as x_6, (select unnest([3, 6]) as unnested_pod) as x_7, (select unnest([0]) as unnested_pod) as x_8
WHERE
  (((x_6.unnested_pod) + (x_7.unnested_pod)) > 8)) AS v
FROM
  t_1_L AS t_0_L ORDER BY k;
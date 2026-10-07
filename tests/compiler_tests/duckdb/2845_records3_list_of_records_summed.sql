-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [{n: 'a', v: 1}, {n: 'b', v: 2}] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [{n: 'c', v: 3}] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_T.k AS k,
  SUM(x_3.unnested_pod.v) AS t
FROM
  t_1_T AS t_0_T, (select unnest(t_0_T.l) as unnested_pod) as x_3
GROUP BY t_0_T.k ORDER BY k;
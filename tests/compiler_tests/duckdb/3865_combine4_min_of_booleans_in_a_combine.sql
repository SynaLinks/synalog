-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      1 AS u
   UNION ALL
  
    SELECT
      2 AS u
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u,
  (SELECT
  MIN((CASE WHEN x_4.unnested_pod = 0 THEN false ELSE NULL END)) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_4
WHERE
  (t_0_U.u = 1)) AS l
FROM
  t_1_U AS t_0_U ORDER BY u;
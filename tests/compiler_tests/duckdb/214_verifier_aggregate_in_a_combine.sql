-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Total AS (SELECT
  SUM(x_8.unnested_pod) AS t
FROM
  (select unnest([1, 3]) as unnested_pod) as x_8)
SELECT
  x_5.unnested_pod AS x,
  ((CAST(x_5.unnested_pod AS DOUBLE)) / NULLIF(CAST(Total.t AS DOUBLE), 0)) AS s
FROM
  t_0_Total AS Total, (select unnest([1, 3]) as unnested_pod) as x_5 ORDER BY x;
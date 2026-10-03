-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_7.unnested_pod AS x,
  ABS(x_7.unnested_pod) AS y,
  100 AS z
FROM
  (select unnest([2, -3]) as unnested_pod) as x_11, (select unnest([2, -3]) as unnested_pod) as x_7
WHERE
  (x_7.unnested_pod = x_11.unnested_pod) ORDER BY x;
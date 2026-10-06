-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_4.unnested_pod AS x,
  ((x_4.unnested_pod) / NULLIF((SELECT
  SUM((CASE WHEN x_7.unnested_pod = 0 THEN x_9.unnested_pod ELSE NULL END)) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_7, (select unnest([1, 3]) as unnested_pod) as x_9), 0)) AS s
FROM
  (select unnest([1, 3]) as unnested_pod) as x_4 ORDER BY x;
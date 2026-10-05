-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_7.unnested_pod AS x,
  CASE WHEN (x_7.unnested_pod > 0) THEN 1 WHEN (x_7.unnested_pod < 0) THEN -1 ELSE 0 END AS s
FROM
  (select unnest([-2, 0, 5]) as unnested_pod) as x_7 ORDER BY x;
-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CASE WHEN (x_7.unnested_pod < 0) THEN -1 ELSE 1 END AS s,
  x_7.unnested_pod AS x
FROM
  (select unnest([5, -5]) as unnested_pod) as x_7 ORDER BY x;
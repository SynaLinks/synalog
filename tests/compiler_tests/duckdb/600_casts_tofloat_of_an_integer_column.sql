-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS x,
  ((CAST(x_3.unnested_pod AS DOUBLE)) / NULLIF(2, 0)) AS h
FROM
  (select unnest([1, 3]) as unnested_pod) as x_3 ORDER BY x;
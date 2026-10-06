-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS x,
  ((x_3.unnested_pod) % NULLIF(3, 0)) AS r
FROM
  (select unnest([-7, 7]) as unnested_pod) as x_3 ORDER BY x;
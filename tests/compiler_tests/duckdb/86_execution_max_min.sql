-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  MIN(x_2.unnested_pod) AS lo,
  MAX(x_2.unnested_pod) AS hi
FROM
  (select unnest([4, 1, 9, 7]) as unnested_pod) as x_2;
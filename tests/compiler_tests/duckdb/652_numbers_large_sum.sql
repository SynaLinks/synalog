-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  SUM(((CAST(ROUND(x_2.unnested_pod) AS BIGINT)) * (1000000000))) AS t
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_2;

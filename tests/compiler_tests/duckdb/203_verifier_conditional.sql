-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_4.unnested_pod AS x,
  CASE WHEN (x_4.unnested_pod > 100) THEN 'large' WHEN (x_4.unnested_pod > 10) THEN 'medium' ELSE 'small' END AS size
FROM
  (select unnest([1, 50, 500]) as unnested_pod) as x_4 ORDER BY x;
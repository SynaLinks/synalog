-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_7.unnested_pod AS x,
  ABS(x_7.unnested_pod) AS y,
  100 AS z
FROM
  (select unnest([2, -3]) as unnested_pod) as x_11, (select unnest([2, -3]) as unnested_pod) as x_7
WHERE
  (x_7.unnested_pod IS NOT DISTINCT FROM x_11.unnested_pod) ORDER BY x;
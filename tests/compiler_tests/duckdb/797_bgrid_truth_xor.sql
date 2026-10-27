-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_5.unnested_pod AS x,
  x_7.unnested_pod AS y
FROM
  (select unnest([0, 1]) as unnested_pod) as x_5, (select unnest([0, 1]) as unnested_pod) as x_7
WHERE
  ((x_5.unnested_pod = 1) IS DISTINCT FROM (x_7.unnested_pod = 1)) ORDER BY x, y;
-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_5.unnested_pod AS a,
  x_7.unnested_pod AS b,
  ABS(((x_5.unnested_pod) - (x_7.unnested_pod))) AS d
FROM
  (select unnest([1, 4]) as unnested_pod) as x_5, (select unnest([1, 4]) as unnested_pod) as x_7
WHERE
  (x_5.unnested_pod IS DISTINCT FROM x_7.unnested_pod) ORDER BY a;
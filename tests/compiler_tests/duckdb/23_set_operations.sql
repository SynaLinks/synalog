-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_6.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5]) as unnested_pod) as x_6, (select unnest([3, 4, 5, 6, 7]) as unnested_pod) as x_8
WHERE
  (x_8.unnested_pod IS NOT DISTINCT FROM x_6.unnested_pod) ORDER BY x;
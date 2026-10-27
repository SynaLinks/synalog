-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_2.unnested_pod AS x
FROM
  (select unnest([2, 4, 6]) as unnested_pod) as x_2, (select unnest([1, 2, 3, 4]) as unnested_pod) as x_4
WHERE
  (x_4.unnested_pod IS NOT DISTINCT FROM x_2.unnested_pod) ORDER BY x;
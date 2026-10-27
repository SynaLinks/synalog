-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_4.unnested_pod AS x
FROM
  (select unnest([1, 2]) as unnested_pod) as x_4, (select unnest([1]) as unnested_pod) as x_6
WHERE
  (x_6.unnested_pod > 5) AND
  (x_6.unnested_pod IS NOT DISTINCT FROM x_4.unnested_pod) ORDER BY x;
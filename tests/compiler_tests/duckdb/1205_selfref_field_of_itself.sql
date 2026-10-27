-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([0, 1]) as unnested_pod) as x_3
WHERE
  ({a: x_3.unnested_pod} IS NOT DISTINCT FROM {a: x_3.unnested_pod}) ORDER BY x;
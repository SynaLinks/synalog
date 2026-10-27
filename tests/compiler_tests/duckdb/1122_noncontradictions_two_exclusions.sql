-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_3
WHERE
  (x_3.unnested_pod IS DISTINCT FROM 1) AND
  (x_3.unnested_pod IS DISTINCT FROM 2);
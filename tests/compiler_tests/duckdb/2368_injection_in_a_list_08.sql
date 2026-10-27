-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_1.unnested_pod AS s
FROM
  (select unnest(['/* comment */ x', 'other']) as unnested_pod) as x_1
WHERE
  (x_1.unnested_pod IS DISTINCT FROM 'other');
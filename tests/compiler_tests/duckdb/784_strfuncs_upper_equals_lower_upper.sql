-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  SUM(1) AS n
FROM
  (select unnest(['Apple', 'kiwi', 'Banana']) as unnested_pod) as x_2
WHERE
  (UPPER(LOWER(x_2.unnested_pod)) IS NOT DISTINCT FROM UPPER(x_2.unnested_pod));
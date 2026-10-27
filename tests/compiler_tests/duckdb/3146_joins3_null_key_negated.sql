-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  1 AS a
FROM
  (SELECT 'singleton' as s) as unused_singleton
WHERE
  ((SELECT
    MIN((CASE WHEN x_5.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    (select unnest([0]) as unnested_pod) as x_5) IS NULL);
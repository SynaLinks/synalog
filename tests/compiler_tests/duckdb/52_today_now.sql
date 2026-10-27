-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  1 AS n
FROM
  (SELECT strftime(current_timestamp AT TIME ZONE 'UTC', '%Y-%m-%d') AS date) AS Today, (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) IS NOT DISTINCT FROM Today.date) ORDER BY n;

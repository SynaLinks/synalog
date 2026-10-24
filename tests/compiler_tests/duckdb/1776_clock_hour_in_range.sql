-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  SUM(1) AS n
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now
WHERE
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS BIGINT) >= 0) AND
  (CAST(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 2) AS BIGINT) <= 23);

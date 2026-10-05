-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  SUBSTR(CAST(Now.timestamp AS TEXT), 11, 1) AS sep,
  SUBSTR(CAST(Now.timestamp AS TEXT), 8, 1) AS d,
  SUBSTR(CAST(Now.timestamp AS TEXT), 14, 1) AS c
FROM
  (SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp) AS Now;

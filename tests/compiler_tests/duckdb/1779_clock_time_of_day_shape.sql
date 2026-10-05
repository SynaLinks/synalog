-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  LENGTH(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8)) AS n,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 3, 1) AS a,
  SUBSTR(SUBSTR(CAST(Now.timestamp AS TEXT), 12, 8), 6, 1) AS b
FROM
  (SELECT current_timestamp AS timestamp) AS Now;

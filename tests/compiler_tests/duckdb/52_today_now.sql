-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  1 AS n
FROM
  (SELECT strftime(current_date, '%Y-%m-%d') AS date) AS Today, (SELECT current_timestamp AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS TEXT), 1, 10) = Today.date) ORDER BY n;
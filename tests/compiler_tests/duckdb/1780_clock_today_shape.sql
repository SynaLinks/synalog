-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  LENGTH(Today.date) AS n,
  SUBSTR(Today.date, 5, 1) AS a,
  SUBSTR(Today.date, 8, 1) AS b
FROM
  (SELECT strftime(current_date, '%Y-%m-%d') AS date) AS Today;

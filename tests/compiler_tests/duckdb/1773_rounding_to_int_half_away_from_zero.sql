-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CAST(ROUND(((5) / (2))) AS BIGINT) AS a,
  CAST(ROUND(- ((5) / (2))) AS BIGINT) AS b,
  CAST(ROUND(3.7) AS BIGINT) AS c,
  CAST(ROUND(((9) / (4))) AS BIGINT) AS d;

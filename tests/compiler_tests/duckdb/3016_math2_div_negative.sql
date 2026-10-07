-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CAST((CASE WHEN ((-7) < 0) <> ((2) < 0) THEN CEIL(CAST(-7 AS DOUBLE) / NULLIF(2, 0)) ELSE FLOOR(CAST(-7 AS DOUBLE) / NULLIF(2, 0)) END) AS BIGINT) AS v;
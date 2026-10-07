-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  (CASE WHEN -3.7E0 < 0 THEN CEIL(-3.7E0) ELSE FLOOR(-3.7E0) END) AS v;
-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  ROUND(2.5E0) AS a,
  ROUND(-2.5E0) AS b,
  ROUND(1.5E0) AS c,
  ROUND(0.5E0) AS d;
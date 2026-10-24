-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  ((7) % NULLIF(3, 0)) AS a,
  ((9) % NULLIF(3, 0)) AS b,
  ((2) % NULLIF(5, 0)) AS c;
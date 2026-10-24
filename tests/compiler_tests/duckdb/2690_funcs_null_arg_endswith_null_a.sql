-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  (LENGTH('a') <= LENGTH(null) AND SUBSTR(null, LENGTH(null) - LENGTH('a') + 1, LENGTH('a')) = 'a') AS v;
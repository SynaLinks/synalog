-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  (CASE WHEN 1 < 0 THEN NULL ELSE array_extract(SPLIT('x', ','), CAST(1 + 1 AS BIGINT)) END) AS e;
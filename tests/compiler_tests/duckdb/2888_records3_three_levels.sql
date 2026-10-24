-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord520744032
drop type if exists synalogrecord520744032 cascade; create type synalogrecord520744032 as struct(c numeric);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord51356806
drop type if exists synalogrecord51356806 cascade; create type synalogrecord51356806 as struct(b synalogrecord520744032);

-- Synalog type: synalogrecord33862796
drop type if exists synalogrecord33862796 cascade; create type synalogrecord33862796 as struct(a synalogrecord51356806);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
SELECT
  {b: {c: 7}}.b.c AS v;
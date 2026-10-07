-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord520744032
drop type if exists logicarecord520744032 cascade; create type logicarecord520744032 as struct(c numeric);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord51356806
drop type if exists logicarecord51356806 cascade; create type logicarecord51356806 as struct(b logicarecord520744032);

-- Logica type: logicarecord33862796
drop type if exists logicarecord33862796 cascade; create type logicarecord33862796 as struct(a logicarecord51356806);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
SELECT
  {b: {c: 7}}.b.c AS v;
-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord6083990
drop type if exists logicarecord6083990 cascade; create type logicarecord6083990 as struct(x numeric, y numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
SELECT
  ((4) * (4)) AS s,
  SQRT(((((4) * (4))) + (((4) * (4))))) AS h,
  CASE WHEN (4 > 0) THEN 1 WHEN (4 < 0) THEN -1 ELSE 0 END AS g;
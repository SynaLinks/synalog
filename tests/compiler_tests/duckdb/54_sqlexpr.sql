-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord907268285
drop type if exists logicarecord907268285 cascade; create type logicarecord907268285 as struct(x double);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_Boosted AS (SELECT
  x_8.unnested_pod AS x,
  x_8.unnested_pod * 100 + 1 AS boosted
FROM
  (select unnest(Range(5)) as unnested_pod) as x_8 ORDER BY x)
SELECT
  Boosted.x AS x,
  Boosted.boosted AS boosted
FROM
  t_0_Boosted AS Boosted ORDER BY x;
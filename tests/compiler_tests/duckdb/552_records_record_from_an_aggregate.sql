-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord986930601
drop type if exists logicarecord986930601 cascade; create type logicarecord986930601 as struct(hi numeric, lo numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_S AS (SELECT
  MIN(x_5.unnested_pod) AS lo,
  MAX(x_5.unnested_pod) AS hi
FROM
  (select unnest([1, 2, 3]::numeric[]) as unnested_pod) as x_5)
SELECT
  S.lo AS lo,
  S.hi AS hi
FROM
  t_0_S AS S;
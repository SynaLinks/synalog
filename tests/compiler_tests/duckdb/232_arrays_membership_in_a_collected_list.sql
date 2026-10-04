-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_L AS (SELECT
  ARRAY_AGG(x_8.unnested_pod) AS l
FROM
  (select unnest([1, 3]::numeric[]) as unnested_pod) as x_8)
SELECT
  x_3.unnested_pod AS x
FROM
  t_0_L AS L, (select unnest(L.l) as unnested_pod) as x_3, (select unnest([1, 2, 3]::numeric[]) as unnested_pod) as x_5
WHERE
  (x_5.unnested_pod = x_3.unnested_pod) ORDER BY x;
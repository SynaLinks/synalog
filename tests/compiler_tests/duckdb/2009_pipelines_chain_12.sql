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
SELECT
  x_27.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as unnested_pod) as x_27
WHERE
  (x_27.unnested_pod != 12) AND
  (x_27.unnested_pod != 11) AND
  (x_27.unnested_pod != 10) AND
  (x_27.unnested_pod != 9) AND
  (x_27.unnested_pod != 8) AND
  (x_27.unnested_pod != 7) AND
  (x_27.unnested_pod != 6) AND
  (x_27.unnested_pod != 5) AND
  (x_27.unnested_pod != 4) AND
  (x_27.unnested_pod != 3) AND
  (x_27.unnested_pod != 2) AND
  (x_27.unnested_pod != 1);
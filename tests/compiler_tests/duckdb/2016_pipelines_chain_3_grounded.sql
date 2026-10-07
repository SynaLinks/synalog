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
DROP TABLE IF EXISTS logica_home.C0;
CREATE TABLE logica_home.C0 AS SELECT
  x_9.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as unnested_pod) as x_9;

-- Interacting with table logica_home.C0

DROP TABLE IF EXISTS logica_home.C3;
CREATE TABLE logica_home.C3 AS SELECT
  C0.x AS x
FROM
  logica_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table logica_home.C3

SELECT
  C3.x AS x
FROM
  logica_home.C3 AS C3 ORDER BY x;
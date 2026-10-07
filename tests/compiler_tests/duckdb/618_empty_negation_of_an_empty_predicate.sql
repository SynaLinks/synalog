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
  x_3.unnested_pod AS x
FROM
  (select unnest([1, 2]::numeric[]) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    (select unnest([0]::numeric[]) as unnested_pod) as x_6, (select unnest([1]::numeric[]) as unnested_pod) as x_8
  WHERE
    (x_8.unnested_pod > 5) AND
    (x_3.unnested_pod = x_8.unnested_pod)) IS NULL) ORDER BY x;
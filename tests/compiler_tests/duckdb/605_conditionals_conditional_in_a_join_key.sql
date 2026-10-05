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
WITH t_0_Name AS (SELECT * FROM (
  
    SELECT
      0 AS p,
      'even' AS n
   UNION ALL
  
    SELECT
      1 AS p,
      'odd' AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_6.unnested_pod AS x,
  Name.n AS n
FROM
  t_0_Name AS Name, (select unnest([1, 2]::numeric[]) as unnested_pod) as x_6
WHERE
  (Name.p = CASE WHEN (((x_6.unnested_pod) % (2)) = 0) THEN 0 ELSE 1 END) ORDER BY x;
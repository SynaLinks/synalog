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
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x,
  (SELECT
  MAX((CASE WHEN x_9.unnested_pod = 0 THEN t_0_V.x ELSE NULL END)) AS logica_value
FROM
  t_1_V AS t_0_V, (select unnest([0]::numeric[]) as unnested_pod) as x_9
WHERE
  (t_0_V.g = V.g)) AS m
FROM
  t_1_V AS V ORDER BY g, x;
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
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_Other_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_V.x AS x
    FROM
      t_0_V AS t_3_V
    WHERE
      (t_3_V.x = 2)
   UNION ALL
  
    SELECT
      t_4_V.x AS x
    FROM
      t_0_V AS t_4_V
    WHERE
      (t_4_V.x = 3)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Other AS (SELECT
  Other_MultBodyAggAux.x AS x
FROM
  t_2_Other_MultBodyAggAux AS Other_MultBodyAggAux
GROUP BY Other_MultBodyAggAux.x)
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_1_Other AS Other, (select unnest([0]::numeric[]) as unnested_pod) as x_4
  WHERE
    (Other.x = V.x)) IS NULL);
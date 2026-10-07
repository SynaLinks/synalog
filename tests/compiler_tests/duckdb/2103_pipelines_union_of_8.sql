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
WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4.unnested_pod AS x
    FROM
      (select unnest([0, 1]::numeric[]) as unnested_pod) as x_4
   UNION ALL
  
    SELECT
      x_6.unnested_pod AS x
    FROM
      (select unnest([2, 3]::numeric[]) as unnested_pod) as x_6
   UNION ALL
  
    SELECT
      x_8.unnested_pod AS x
    FROM
      (select unnest([4, 5]::numeric[]) as unnested_pod) as x_8
   UNION ALL
  
    SELECT
      x_10.unnested_pod AS x
    FROM
      (select unnest([6, 7]::numeric[]) as unnested_pod) as x_10
   UNION ALL
  
    SELECT
      x_12.unnested_pod AS x
    FROM
      (select unnest([8, 9]::numeric[]) as unnested_pod) as x_12
   UNION ALL
  
    SELECT
      x_14.unnested_pod AS x
    FROM
      (select unnest([10, 11]::numeric[]) as unnested_pod) as x_14
   UNION ALL
  
    SELECT
      x_16.unnested_pod AS x
    FROM
      (select unnest([12, 13]::numeric[]) as unnested_pod) as x_16
   UNION ALL
  
    SELECT
      x_18.unnested_pod AS x
    FROM
      (select unnest([14, 15]::numeric[]) as unnested_pod) as x_18
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY W_MultBodyAggAux.x)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;
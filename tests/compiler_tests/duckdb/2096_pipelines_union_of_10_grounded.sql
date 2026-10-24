-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
DROP TABLE IF EXISTS synalog_home.W;
CREATE TABLE synalog_home.W AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
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
   UNION ALL
  
    SELECT
      x_20.unnested_pod AS x
    FROM
      (select unnest([16, 17]::numeric[]) as unnested_pod) as x_20
   UNION ALL
  
    SELECT
      x_22.unnested_pod AS x
    FROM
      (select unnest([18, 19]::numeric[]) as unnested_pod) as x_22
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_0_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY W_MultBodyAggAux.x;

-- Interacting with table synalog_home.W

SELECT
  SUM(1) AS n
FROM
  synalog_home.W AS W;
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
WITH t_1_Banned AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5.unnested_pod AS x
    FROM
      (select unnest([1, 2, 3]::numeric[]) as unnested_pod) as x_5
    WHERE
      ((SELECT
        MIN((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
      FROM
        t_1_Banned AS Banned, (select unnest([0]::numeric[]) as unnested_pod) as x_8
      WHERE
        (Banned.x = x_5.unnested_pod)) IS NULL)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      (select unnest([1, 2, 3]::numeric[]) as unnested_pod) as x_12
    WHERE
      (x_12.unnested_pod = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY Out_MultBodyAggAux.x ORDER BY x;
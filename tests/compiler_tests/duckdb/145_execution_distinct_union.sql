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
WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3.unnested_pod AS x
    FROM
      (select unnest([1, 2]::numeric[]) as unnested_pod) as x_3
   UNION ALL
  
    SELECT
      x_5.unnested_pod AS x
    FROM
      (select unnest([2, 3]::numeric[]) as unnested_pod) as x_5
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.x ORDER BY x;
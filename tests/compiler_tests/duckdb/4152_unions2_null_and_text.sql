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
WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      x_6.unnested_pod AS k,
      CASE WHEN (x_6.unnested_pod = 2) THEN 'b' ELSE 'c' END AS s
    FROM
      (select unnest([2, 3]::numeric[]) as unnested_pod) as x_6
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.s AS s
FROM
  t_0_U AS U ORDER BY k;
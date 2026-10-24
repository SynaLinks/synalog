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
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      x_6.unnested_pod AS x
    FROM
      (select unnest([1, 2]::numeric[]) as unnested_pod) as x_6
   UNION ALL
  
    SELECT
      'b' AS src,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.src AS src,
  SUM(1) AS n
FROM
  t_0_S AS S
GROUP BY S.src ORDER BY src;
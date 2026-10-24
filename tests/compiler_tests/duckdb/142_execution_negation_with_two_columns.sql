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
WITH t_0_Want AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Want.a AS a,
  Want.b AS b
FROM
  t_0_Want AS Want
WHERE
  ((SELECT
    MIN((CASE WHEN x_7.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    (select unnest([0]::numeric[]) as unnested_pod) as x_7
  WHERE
    (Want.a = 1) AND
    (Want.b = 3)) IS NULL);
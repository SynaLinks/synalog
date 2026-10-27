-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_27.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_27
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_27.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_43.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_43, (select unnest(Range(100)) as unnested_pod) as x_49
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_43.unnested_pod IS NOT DISTINCT FROM ((x_49.unnested_pod) + (1))) AND
        (x_49.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_65.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_65, (select unnest(Range(100)) as unnested_pod) as x_72, (select unnest(Range(100)) as unnested_pod) as x_78
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_65.unnested_pod IS NOT DISTINCT FROM ((x_72.unnested_pod) + (1))) AND
        (x_72.unnested_pod IS NOT DISTINCT FROM ((x_78.unnested_pod) + (1))) AND
        (x_78.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_85.unnested_pod) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, (select unnest(Range(100)) as unnested_pod) as x_85
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 22) AND
  (t_15_Reach_RecursiveCte.y IS NOT DISTINCT FROM x_85.unnested_pod)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([10, 22, 23]) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Reach AS Reach, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (Reach.y IS NOT DISTINCT FROM x_3.unnested_pod)) IS NULL) ORDER BY x;
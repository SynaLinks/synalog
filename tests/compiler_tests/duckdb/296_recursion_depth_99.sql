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
        ((x_21.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(200)) as unnested_pod) as x_21
      WHERE
        (0 < 99) AND
        (1 = 0) AND
        (x_21.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_37.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(200)) as unnested_pod) as x_37, (select unnest(Range(200)) as unnested_pod) as x_43
      WHERE
        (((0) + (1)) < 99) AND
        (0 < 99) AND
        (1 = 0) AND
        (x_37.unnested_pod IS NOT DISTINCT FROM ((x_43.unnested_pod) + (1))) AND
        (x_43.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_59.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(200)) as unnested_pod) as x_59, (select unnest(Range(200)) as unnested_pod) as x_66, (select unnest(Range(200)) as unnested_pod) as x_72
      WHERE
        (((((0) + (1))) + (1)) < 99) AND
        (((0) + (1)) < 99) AND
        (0 < 99) AND
        (1 = 0) AND
        (x_59.unnested_pod IS NOT DISTINCT FROM ((x_66.unnested_pod) + (1))) AND
        (x_66.unnested_pod IS NOT DISTINCT FROM ((x_72.unnested_pod) + (1))) AND
        (x_72.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_79.unnested_pod) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, (select unnest(Range(200)) as unnested_pod) as x_79
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 99) AND
  (t_15_Reach_RecursiveCte.y IS NOT DISTINCT FROM x_79.unnested_pod)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y)
SELECT
  MAX(Reach.y) AS m
FROM
  t_0_Reach AS Reach;
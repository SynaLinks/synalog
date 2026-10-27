-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_2_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_25.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_25
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_25.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_41.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_41, (select unnest(Range(100)) as unnested_pod) as x_47
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_41.unnested_pod IS NOT DISTINCT FROM ((x_47.unnested_pod) + (1))) AND
        (x_47.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_63.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_63, (select unnest(Range(100)) as unnested_pod) as x_70, (select unnest(Range(100)) as unnested_pod) as x_76
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_63.unnested_pod IS NOT DISTINCT FROM ((x_70.unnested_pod) + (1))) AND
        (x_70.unnested_pod IS NOT DISTINCT FROM ((x_76.unnested_pod) + (1))) AND
        (x_76.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_83.unnested_pod) + (1)) AS y,
  ((t_16_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Reach_RecursiveCte AS t_16_Reach_RecursiveCte, (select unnest(Range(100)) as unnested_pod) as x_83
WHERE
  (t_16_Reach_RecursiveCte.synalog_step < 21) AND
  (t_16_Reach_RecursiveCte.y IS NOT DISTINCT FROM x_83.unnested_pod)),
t_1_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_2_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y),
t_0_Far AS (SELECT
  MAX(Reach.y) AS m
FROM
  t_1_Reach AS Reach),
t_18_Count AS (SELECT
  SUM(1) AS n
FROM
  t_1_Reach AS t_19_Reach)
SELECT
  Far.m AS m,
  Count.n AS n
FROM
  t_0_Far AS Far, t_18_Count AS Count;
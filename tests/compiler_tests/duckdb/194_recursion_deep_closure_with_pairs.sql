-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        x_15.unnested_pod AS x,
        ((x_15.unnested_pod) + (1)) AS y,
        0 AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_15
     UNION ALL
    
      SELECT
        x_42.unnested_pod AS x,
        ((x_36.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_36, (select unnest(Range(4)) as unnested_pod) as x_42
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_36.unnested_pod IS NOT DISTINCT FROM ((x_42.unnested_pod) + (1)))
     UNION ALL
    
      SELECT
        x_78.unnested_pod AS x,
        ((x_64.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_64, (select unnest(Range(4)) as unnested_pod) as x_72, (select unnest(Range(4)) as unnested_pod) as x_78
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_64.unnested_pod IS NOT DISTINCT FROM ((x_72.unnested_pod) + (1))) AND
        (x_72.unnested_pod IS NOT DISTINCT FROM ((x_78.unnested_pod) + (1)))
     UNION ALL
    
      SELECT
        x_123.unnested_pod AS x,
        ((x_100.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_100, (select unnest(Range(4)) as unnested_pod) as x_109, (select unnest(Range(4)) as unnested_pod) as x_117, (select unnest(Range(4)) as unnested_pod) as x_123
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_100.unnested_pod IS NOT DISTINCT FROM ((x_109.unnested_pod) + (1))) AND
        (x_109.unnested_pod IS NOT DISTINCT FROM ((x_117.unnested_pod) + (1))) AND
        (x_117.unnested_pod IS NOT DISTINCT FROM ((x_123.unnested_pod) + (1)))
     UNION ALL
    
      SELECT
        x_177.unnested_pod AS x,
        ((x_145.unnested_pod) + (1)) AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_145, (select unnest(Range(4)) as unnested_pod) as x_154, (select unnest(Range(4)) as unnested_pod) as x_163, (select unnest(Range(4)) as unnested_pod) as x_171, (select unnest(Range(4)) as unnested_pod) as x_177
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_145.unnested_pod IS NOT DISTINCT FROM ((x_154.unnested_pod) + (1))) AND
        (x_154.unnested_pod IS NOT DISTINCT FROM ((x_163.unnested_pod) + (1))) AND
        (x_163.unnested_pod IS NOT DISTINCT FROM ((x_171.unnested_pod) + (1))) AND
        (x_171.unnested_pod IS NOT DISTINCT FROM ((x_177.unnested_pod) + (1)))
     UNION ALL
    
      SELECT
        x_240.unnested_pod AS x,
        ((x_199.unnested_pod) + (1)) AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_199, (select unnest(Range(4)) as unnested_pod) as x_208, (select unnest(Range(4)) as unnested_pod) as x_217, (select unnest(Range(4)) as unnested_pod) as x_226, (select unnest(Range(4)) as unnested_pod) as x_234, (select unnest(Range(4)) as unnested_pod) as x_240
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 21) AND
        (((((((0) + (1))) + (1))) + (1)) < 21) AND
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_199.unnested_pod IS NOT DISTINCT FROM ((x_208.unnested_pod) + (1))) AND
        (x_208.unnested_pod IS NOT DISTINCT FROM ((x_217.unnested_pod) + (1))) AND
        (x_217.unnested_pod IS NOT DISTINCT FROM ((x_226.unnested_pod) + (1))) AND
        (x_226.unnested_pod IS NOT DISTINCT FROM ((x_234.unnested_pod) + (1))) AND
        (x_234.unnested_pod IS NOT DISTINCT FROM ((x_240.unnested_pod) + (1)))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_Reach_RecursiveCte.x AS x,
  ((x_249.unnested_pod) + (1)) AS y,
  ((t_41_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_41_Reach_RecursiveCte, (select unnest(Range(4)) as unnested_pod) as x_249
WHERE
  (t_41_Reach_RecursiveCte.synalog_step < 21) AND
  (t_41_Reach_RecursiveCte.y IS NOT DISTINCT FROM x_249.unnested_pod)),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;
-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_20.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_20
      WHERE
        (0 < 5000) AND
        (1 = 0) AND
        (x_20.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_36.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_36, (select unnest(Range(10)) as unnested_pod) as x_42
      WHERE
        (((0) + (1)) < 5000) AND
        (0 < 5000) AND
        (1 = 0) AND
        (x_36.unnested_pod IS NOT DISTINCT FROM ((x_42.unnested_pod) + (1))) AND
        (x_42.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_58.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_58, (select unnest(Range(10)) as unnested_pod) as x_65, (select unnest(Range(10)) as unnested_pod) as x_71
      WHERE
        (((((0) + (1))) + (1)) < 5000) AND
        (((0) + (1)) < 5000) AND
        (0 < 5000) AND
        (1 = 0) AND
        (x_58.unnested_pod IS NOT DISTINCT FROM ((x_65.unnested_pod) + (1))) AND
        (x_65.unnested_pod IS NOT DISTINCT FROM ((x_71.unnested_pod) + (1))) AND
        (x_71.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_78.unnested_pod) + (1)) AS y,
  ((t_14_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_14_Reach_RecursiveCte, (select unnest(Range(10)) as unnested_pod) as x_78
WHERE
  (t_14_Reach_RecursiveCte.synalog_step < 5000) AND
  (t_14_Reach_RecursiveCte.y IS NOT DISTINCT FROM x_78.unnested_pod))
SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y ORDER BY y;
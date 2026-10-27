-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_23.unnested_pod) + (2)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_23
      WHERE
        (((x_23.unnested_pod) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_23.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_39.unnested_pod) + (2)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_39, (select unnest(Range(100)) as unnested_pod) as x_45
      WHERE
        (((x_39.unnested_pod) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_45.unnested_pod) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_39.unnested_pod IS NOT DISTINCT FROM ((x_45.unnested_pod) + (2))) AND
        (x_45.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_61.unnested_pod) + (2)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_61, (select unnest(Range(100)) as unnested_pod) as x_68, (select unnest(Range(100)) as unnested_pod) as x_74
      WHERE
        (((x_61.unnested_pod) + (2)) < 25) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((x_68.unnested_pod) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((x_74.unnested_pod) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (x_61.unnested_pod IS NOT DISTINCT FROM ((x_68.unnested_pod) + (2))) AND
        (x_68.unnested_pod IS NOT DISTINCT FROM ((x_74.unnested_pod) + (2))) AND
        (x_74.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_81.unnested_pod) + (2)) AS y,
  ((t_17_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_R_RecursiveCte AS t_17_R_RecursiveCte, (select unnest(Range(100)) as unnested_pod) as x_81
WHERE
  (((x_81.unnested_pod) + (2)) < 25) AND
  (t_17_R_RecursiveCte.synalog_step < 30) AND
  (t_17_R_RecursiveCte.y IS NOT DISTINCT FROM x_81.unnested_pod)),
t_2_R AS (SELECT
  R_RecursiveCte.y AS y
FROM
  t_3_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.y),
t_1_M AS (SELECT
  MAX(R.y) AS m
FROM
  t_2_R AS R)
SELECT
  t_0_M.m AS m
FROM
  t_1_M AS t_0_M ORDER BY m;
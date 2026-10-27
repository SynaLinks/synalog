-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_A_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_22.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_22
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (x_22.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_38.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_38, (select unnest(Range(100)) as unnested_pod) as x_44
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_38.unnested_pod IS NOT DISTINCT FROM ((x_44.unnested_pod) + (1))) AND
        (x_44.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_60.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_60, (select unnest(Range(100)) as unnested_pod) as x_67, (select unnest(Range(100)) as unnested_pod) as x_73
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (x_60.unnested_pod IS NOT DISTINCT FROM ((x_67.unnested_pod) + (1))) AND
        (x_67.unnested_pod IS NOT DISTINCT FROM ((x_73.unnested_pod) + (1))) AND
        (x_73.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_80.unnested_pod) + (1)) AS y,
  ((t_17_A_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_A_RecursiveCte AS t_17_A_RecursiveCte, (select unnest(Range(100)) as unnested_pod) as x_80
WHERE
  (t_17_A_RecursiveCte.synalog_step < 21) AND
  (t_17_A_RecursiveCte.y IS NOT DISTINCT FROM x_80.unnested_pod)),
t_2_A AS (SELECT
  A_RecursiveCte.y AS y
FROM
  t_3_A_RecursiveCte AS A_RecursiveCte
GROUP BY A_RecursiveCte.y),
t_20_B_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_101.unnested_pod) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_101
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (x_101.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_117.unnested_pod) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_117, (select unnest(Range(100)) as unnested_pod) as x_123
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_117.unnested_pod IS NOT DISTINCT FROM ((x_123.unnested_pod) + (1))) AND
        (x_123.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_139.unnested_pod) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(100)) as unnested_pod) as x_139, (select unnest(Range(100)) as unnested_pod) as x_146, (select unnest(Range(100)) as unnested_pod) as x_152
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (x_139.unnested_pod IS NOT DISTINCT FROM ((x_146.unnested_pod) + (1))) AND
        (x_146.unnested_pod IS NOT DISTINCT FROM ((x_152.unnested_pod) + (1))) AND
        (x_152.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_159.unnested_pod) + (1)) AS y,
  ((t_35_B_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_20_B_RecursiveCte AS t_35_B_RecursiveCte, (select unnest(Range(100)) as unnested_pod) as x_159
WHERE
  (t_35_B_RecursiveCte.synalog_step < 22) AND
  (t_35_B_RecursiveCte.y IS NOT DISTINCT FROM x_159.unnested_pod)),
t_19_B AS (SELECT
  B_RecursiveCte.y AS y
FROM
  t_20_B_RecursiveCte AS B_RecursiveCte
GROUP BY B_RecursiveCte.y)
SELECT
  MAX(t_0_A.y) AS a,
  MAX(t_1_B.y) AS b
FROM
  t_2_A AS t_0_A, t_19_B AS t_1_B;
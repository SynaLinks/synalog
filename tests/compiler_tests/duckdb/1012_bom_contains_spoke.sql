-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Contains_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Uses.part AS part,
        Uses.component AS component,
        0 AS synalog_step
      FROM
        t_2_Uses AS Uses
     UNION ALL
    
      SELECT
        t_5_Uses.part AS part,
        t_3_Uses.component AS component,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_5_Uses, t_2_Uses AS t_3_Uses
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_3_Uses.part IS NOT DISTINCT FROM t_5_Uses.component)
     UNION ALL
    
      SELECT
        t_11_Uses.part AS part,
        t_7_Uses.component AS component,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_11_Uses, t_2_Uses AS t_9_Uses, t_2_Uses AS t_7_Uses
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_7_Uses.part IS NOT DISTINCT FROM t_9_Uses.component) AND
        (t_9_Uses.part IS NOT DISTINCT FROM t_11_Uses.component)
     UNION ALL
    
      SELECT
        t_19_Uses.part AS part,
        t_13_Uses.component AS component,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_19_Uses, t_2_Uses AS t_17_Uses, t_2_Uses AS t_15_Uses, t_2_Uses AS t_13_Uses
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_13_Uses.part IS NOT DISTINCT FROM t_15_Uses.component) AND
        (t_15_Uses.part IS NOT DISTINCT FROM t_17_Uses.component) AND
        (t_17_Uses.part IS NOT DISTINCT FROM t_19_Uses.component)
     UNION ALL
    
      SELECT
        t_29_Uses.part AS part,
        t_21_Uses.component AS component,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_29_Uses, t_2_Uses AS t_27_Uses, t_2_Uses AS t_25_Uses, t_2_Uses AS t_23_Uses, t_2_Uses AS t_21_Uses
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_21_Uses.part IS NOT DISTINCT FROM t_23_Uses.component) AND
        (t_23_Uses.part IS NOT DISTINCT FROM t_25_Uses.component) AND
        (t_25_Uses.part IS NOT DISTINCT FROM t_27_Uses.component) AND
        (t_27_Uses.part IS NOT DISTINCT FROM t_29_Uses.component)
     UNION ALL
    
      SELECT
        t_41_Uses.part AS part,
        t_31_Uses.component AS component,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_41_Uses, t_2_Uses AS t_39_Uses, t_2_Uses AS t_37_Uses, t_2_Uses AS t_35_Uses, t_2_Uses AS t_33_Uses, t_2_Uses AS t_31_Uses
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_31_Uses.part IS NOT DISTINCT FROM t_33_Uses.component) AND
        (t_33_Uses.part IS NOT DISTINCT FROM t_35_Uses.component) AND
        (t_35_Uses.part IS NOT DISTINCT FROM t_37_Uses.component) AND
        (t_37_Uses.part IS NOT DISTINCT FROM t_39_Uses.component) AND
        (t_39_Uses.part IS NOT DISTINCT FROM t_41_Uses.component)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Contains_RecursiveCte.part AS part,
  t_43_Uses.component AS component,
  ((t_42_Contains_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Contains_RecursiveCte AS t_42_Contains_RecursiveCte, t_2_Uses AS t_43_Uses
WHERE
  (t_42_Contains_RecursiveCte.synalog_step < 6) AND
  (t_43_Uses.part IS NOT DISTINCT FROM t_42_Contains_RecursiveCte.component)),
t_0_Contains AS (SELECT
  Contains_RecursiveCte.part AS part,
  Contains_RecursiveCte.component AS component
FROM
  t_1_Contains_RecursiveCte AS Contains_RecursiveCte
GROUP BY Contains_RecursiveCte.part, Contains_RecursiveCte.component)
SELECT
  Contains.component AS component
FROM
  t_0_Contains AS Contains
WHERE
  (Contains.part = 'spoke')
GROUP BY Contains.component ORDER BY component;
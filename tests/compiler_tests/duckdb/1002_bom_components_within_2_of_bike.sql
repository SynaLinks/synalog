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
t_1_Down_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Uses.component AS component,
        0 AS synalog_step
      FROM
        t_2_Uses AS Uses
      WHERE
        (Uses.part = 'bike')
     UNION ALL
    
      SELECT
        t_3_Uses.component AS component,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_5_Uses, t_2_Uses AS t_3_Uses
      WHERE
        (0 < 2) AND
        (1 = 0) AND
        (t_5_Uses.part = 'bike') AND
        (t_3_Uses.part IS NOT DISTINCT FROM t_5_Uses.component)
     UNION ALL
    
      SELECT
        t_7_Uses.component AS component,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_11_Uses, t_2_Uses AS t_9_Uses, t_2_Uses AS t_7_Uses
      WHERE
        (((0) + (1)) < 2) AND
        (0 < 2) AND
        (1 = 0) AND
        (t_7_Uses.part IS NOT DISTINCT FROM t_9_Uses.component) AND
        (t_11_Uses.part = 'bike') AND
        (t_9_Uses.part IS NOT DISTINCT FROM t_11_Uses.component)
     UNION ALL
    
      SELECT
        t_13_Uses.component AS component,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_19_Uses, t_2_Uses AS t_17_Uses, t_2_Uses AS t_15_Uses, t_2_Uses AS t_13_Uses
      WHERE
        (((((0) + (1))) + (1)) < 2) AND
        (((0) + (1)) < 2) AND
        (0 < 2) AND
        (1 = 0) AND
        (t_13_Uses.part IS NOT DISTINCT FROM t_15_Uses.component) AND
        (t_15_Uses.part IS NOT DISTINCT FROM t_17_Uses.component) AND
        (t_19_Uses.part = 'bike') AND
        (t_17_Uses.part IS NOT DISTINCT FROM t_19_Uses.component)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_21_Uses.component AS component,
  ((t_20_Down_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Down_RecursiveCte AS t_20_Down_RecursiveCte, t_2_Uses AS t_21_Uses
WHERE
  (t_20_Down_RecursiveCte.synalog_step < 2) AND
  (t_21_Uses.part IS NOT DISTINCT FROM t_20_Down_RecursiveCte.component)),
t_0_Down AS (SELECT
  Down_RecursiveCte.component AS component
FROM
  t_1_Down_RecursiveCte AS Down_RecursiveCte
GROUP BY Down_RecursiveCte.component)
SELECT
  Down.component AS component
FROM
  t_0_Down AS Down
GROUP BY Down.component ORDER BY component;
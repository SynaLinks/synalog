-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (Uses.part = 'scooter')
     UNION ALL
    
      SELECT
        t_3_Uses.component AS component,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_5_Uses, t_2_Uses AS t_3_Uses
      WHERE
        (0 < 1) AND
        (1 = 0) AND
        (t_5_Uses.part = 'scooter') AND
        (COALESCE(t_3_Uses.part, '') = COALESCE(t_5_Uses.component, '') AND (t_3_Uses.part IS NULL) = (t_5_Uses.component IS NULL))
     UNION ALL
    
      SELECT
        t_7_Uses.component AS component,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_11_Uses, t_2_Uses AS t_9_Uses, t_2_Uses AS t_7_Uses
      WHERE
        (((0) + (1)) < 1) AND
        (0 < 1) AND
        (1 = 0) AND
        (COALESCE(t_7_Uses.part, '') = COALESCE(t_9_Uses.component, '') AND (t_7_Uses.part IS NULL) = (t_9_Uses.component IS NULL)) AND
        (t_11_Uses.part = 'scooter') AND
        (COALESCE(t_9_Uses.part, '') = COALESCE(t_11_Uses.component, '') AND (t_9_Uses.part IS NULL) = (t_11_Uses.component IS NULL))
     UNION ALL
    
      SELECT
        t_13_Uses.component AS component,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_19_Uses, t_2_Uses AS t_17_Uses, t_2_Uses AS t_15_Uses, t_2_Uses AS t_13_Uses
      WHERE
        (((((0) + (1))) + (1)) < 1) AND
        (((0) + (1)) < 1) AND
        (0 < 1) AND
        (1 = 0) AND
        (COALESCE(t_13_Uses.part, '') = COALESCE(t_15_Uses.component, '') AND (t_13_Uses.part IS NULL) = (t_15_Uses.component IS NULL)) AND
        (COALESCE(t_15_Uses.part, '') = COALESCE(t_17_Uses.component, '') AND (t_15_Uses.part IS NULL) = (t_17_Uses.component IS NULL)) AND
        (t_19_Uses.part = 'scooter') AND
        (COALESCE(t_17_Uses.part, '') = COALESCE(t_19_Uses.component, '') AND (t_17_Uses.part IS NULL) = (t_19_Uses.component IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_21_Uses.component AS component,
  ((t_20_Down_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Down_RecursiveCte AS t_20_Down_RecursiveCte, t_2_Uses AS t_21_Uses
WHERE
  (t_20_Down_RecursiveCte.synalog_step < 1) AND
  (COALESCE(t_21_Uses.part, '') = COALESCE(t_20_Down_RecursiveCte.component, '') AND (t_21_Uses.part IS NULL) = (t_20_Down_RecursiveCte.component IS NULL))),
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
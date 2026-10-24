-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((1) * (2)) AS x,
        ((0) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (1 < 8) AND
        (0 < 10) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((1) * (2))) * (2)) AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((1) * (2)) < 8) AND
        (((0) + (1)) < 10) AND
        (1 < 8) AND
        (0 < 10) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((((1) * (2))) * (2))) * (2)) AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((((1) * (2))) * (2)) < 8) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((1) * (2)) < 8) AND
        (((0) + (1)) < 10) AND
        (1 < 8) AND
        (0 < 10) AND
        (1 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((t_9_R_RecursiveCte.x) * (2)) AS x,
  ((t_9_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_9_R_RecursiveCte
WHERE
  (t_9_R_RecursiveCte.x < 8) AND
  (t_9_R_RecursiveCte.synalog_step < 10))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;
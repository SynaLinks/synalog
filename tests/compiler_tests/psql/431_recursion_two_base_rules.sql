-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_R_RecursiveCte_base AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS synalog_step
   UNION ALL
  
    SELECT
      10 AS x,
      0 AS synalog_step
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        R_RecursiveCte_base.x AS x,
        R_RecursiveCte_base.synalog_step AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS R_RecursiveCte_base
     UNION ALL
    
      SELECT
        ((t_2_R_RecursiveCte_base.x) + (1)) AS x,
        ((t_2_R_RecursiveCte_base.synalog_step) + (1)) AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS t_2_R_RecursiveCte_base
      WHERE
        (((MOD(CAST(t_2_R_RecursiveCte_base.x AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (t_2_R_RecursiveCte_base.x = 1)) AND
        (t_2_R_RecursiveCte_base.synalog_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((t_5_R_RecursiveCte_base.x) + (1))) + (1)) AS x,
        ((((t_5_R_RecursiveCte_base.synalog_step) + (1))) + (1)) AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS t_5_R_RecursiveCte_base
      WHERE
        (((MOD(CAST(((t_5_R_RecursiveCte_base.x) + (1)) AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (((t_5_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_5_R_RecursiveCte_base.synalog_step) + (1)) < 3) AND
        (((MOD(CAST(t_5_R_RecursiveCte_base.x AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (t_5_R_RecursiveCte_base.x = 1)) AND
        (t_5_R_RecursiveCte_base.synalog_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((((t_9_R_RecursiveCte_base.x) + (1))) + (1))) + (1)) AS x,
        ((((((t_9_R_RecursiveCte_base.synalog_step) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS t_9_R_RecursiveCte_base
      WHERE
        (((MOD(CAST(((((t_9_R_RecursiveCte_base.x) + (1))) + (1)) AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (((((t_9_R_RecursiveCte_base.x) + (1))) + (1)) = 1)) AND
        (((((t_9_R_RecursiveCte_base.synalog_step) + (1))) + (1)) < 3) AND
        (((MOD(CAST(((t_9_R_RecursiveCte_base.x) + (1)) AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (((t_9_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_9_R_RecursiveCte_base.synalog_step) + (1)) < 3) AND
        (((MOD(CAST(t_9_R_RecursiveCte_base.x AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (t_9_R_RecursiveCte_base.x = 1)) AND
        (t_9_R_RecursiveCte_base.synalog_step < 3) AND
        (1 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((t_10_R_RecursiveCte.x) + (1)) AS x,
  ((t_10_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_10_R_RecursiveCte
WHERE
  (((MOD(CAST(t_10_R_RecursiveCte.x AS numeric), NULLIF(CAST(10 AS numeric), 0))) = 0) OR (t_10_R_RecursiveCte.x = 1)) AND
  (t_10_R_RecursiveCte.synalog_step < 3))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;
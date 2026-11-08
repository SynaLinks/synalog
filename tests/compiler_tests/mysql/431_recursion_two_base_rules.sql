-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
        (((MOD(t_2_R_RecursiveCte_base.x, NULLIF(10, 0))) = 0) OR (t_2_R_RecursiveCte_base.x = 1)) AND
        (t_2_R_RecursiveCte_base.synalog_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((t_5_R_RecursiveCte_base.x) + (1))) + (1)) AS x,
        ((((t_5_R_RecursiveCte_base.synalog_step) + (1))) + (1)) AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS t_5_R_RecursiveCte_base
      WHERE
        (((MOD(((t_5_R_RecursiveCte_base.x) + (1)), NULLIF(10, 0))) = 0) OR (((t_5_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_5_R_RecursiveCte_base.synalog_step) + (1)) < 3) AND
        (((MOD(t_5_R_RecursiveCte_base.x, NULLIF(10, 0))) = 0) OR (t_5_R_RecursiveCte_base.x = 1)) AND
        (t_5_R_RecursiveCte_base.synalog_step < 3) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        ((((((t_9_R_RecursiveCte_base.x) + (1))) + (1))) + (1)) AS x,
        ((((((t_9_R_RecursiveCte_base.synalog_step) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_R_RecursiveCte_base AS t_9_R_RecursiveCte_base
      WHERE
        (((MOD(((((t_9_R_RecursiveCte_base.x) + (1))) + (1)), NULLIF(10, 0))) = 0) OR (((((t_9_R_RecursiveCte_base.x) + (1))) + (1)) = 1)) AND
        (((((t_9_R_RecursiveCte_base.synalog_step) + (1))) + (1)) < 3) AND
        (((MOD(((t_9_R_RecursiveCte_base.x) + (1)), NULLIF(10, 0))) = 0) OR (((t_9_R_RecursiveCte_base.x) + (1)) = 1)) AND
        (((t_9_R_RecursiveCte_base.synalog_step) + (1)) < 3) AND
        (((MOD(t_9_R_RecursiveCte_base.x, NULLIF(10, 0))) = 0) OR (t_9_R_RecursiveCte_base.x = 1)) AND
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
  (((MOD(t_10_R_RecursiveCte.x, NULLIF(10, 0))) = 0) OR (t_10_R_RecursiveCte.x = 1)) AND
  (t_10_R_RecursiveCte.synalog_step < 3))
SELECT * FROM (
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_3_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_RecursiveCte_f1 AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        t_2_Loop.a AS a,
        t_2_Loop.b AS b,
        0 AS synalog_step
      FROM
        t_3_Loop AS t_2_Loop
     UNION ALL
    
      SELECT
        t_6_Loop.a AS a,
        t_4_Loop.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Loop AS t_6_Loop, t_3_Loop AS t_4_Loop
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_4_Loop.a = t_6_Loop.b)
     UNION ALL
    
      SELECT
        t_12_Loop.a AS a,
        t_8_Loop.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Loop AS t_12_Loop, t_3_Loop AS t_10_Loop, t_3_Loop AS t_8_Loop
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_8_Loop.a = t_10_Loop.b) AND
        (t_10_Loop.a = t_12_Loop.b)
     UNION ALL
    
      SELECT
        t_20_Loop.a AS a,
        t_14_Loop.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Loop AS t_20_Loop, t_3_Loop AS t_18_Loop, t_3_Loop AS t_16_Loop, t_3_Loop AS t_14_Loop
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_14_Loop.a = t_16_Loop.b) AND
        (t_16_Loop.a = t_18_Loop.b) AND
        (t_18_Loop.a = t_20_Loop.b)
     UNION ALL
    
      SELECT
        t_30_Loop.a AS a,
        t_22_Loop.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Loop AS t_30_Loop, t_3_Loop AS t_28_Loop, t_3_Loop AS t_26_Loop, t_3_Loop AS t_24_Loop, t_3_Loop AS t_22_Loop
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_22_Loop.a = t_24_Loop.b) AND
        (t_24_Loop.a = t_26_Loop.b) AND
        (t_26_Loop.a = t_28_Loop.b) AND
        (t_28_Loop.a = t_30_Loop.b)
     UNION ALL
    
      SELECT
        t_42_Loop.a AS a,
        t_32_Loop.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Loop AS t_42_Loop, t_3_Loop AS t_40_Loop, t_3_Loop AS t_38_Loop, t_3_Loop AS t_36_Loop, t_3_Loop AS t_34_Loop, t_3_Loop AS t_32_Loop
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_32_Loop.a = t_34_Loop.b) AND
        (t_34_Loop.a = t_36_Loop.b) AND
        (t_36_Loop.a = t_38_Loop.b) AND
        (t_38_Loop.a = t_40_Loop.b) AND
        (t_40_Loop.a = t_42_Loop.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_Graph_Reach_RecursiveCte_f1.a AS a,
  t_44_Loop.b AS b,
  ((t_43_Graph_Reach_RecursiveCte_f1.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Graph_Reach_RecursiveCte_f1 AS t_43_Graph_Reach_RecursiveCte_f1, t_3_Loop AS t_44_Loop
WHERE
  (t_43_Graph_Reach_RecursiveCte_f1.synalog_step < 8) AND
  (t_44_Loop.a = t_43_Graph_Reach_RecursiveCte_f1.b)),
t_0_R AS (SELECT
  Graph_Reach_RecursiveCte_f1.a AS a,
  Graph_Reach_RecursiveCte_f1.b AS b
FROM
  t_1_Graph_Reach_RecursiveCte_f1 AS Graph_Reach_RecursiveCte_f1
GROUP BY 1, 2)
SELECT * FROM (
SELECT
  R.b AS b
FROM
  t_0_R AS R
WHERE
  (R.a = 'x')
) AS UNUSED_TABLE_NAME ORDER BY b IS NULL, b;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      20 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_2_R AS R
GROUP BY 1)
SELECT * FROM (
SELECT
  t_0_T.k AS k
FROM
  t_1_T AS t_0_T
WHERE
  (t_0_T.t > 10)
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;
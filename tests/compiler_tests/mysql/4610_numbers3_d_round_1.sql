-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      2.5e0 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      -2.5e0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS k,
      null AS x
   UNION ALL
  
    SELECT
      7 AS k,
      0.1e0 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      -0.75e0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_X.k AS k,
  (SELECT (CASE WHEN synalog_v IS NULL OR 1 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 1 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 1) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 1)) / POWER(10, 1) + 0 END) FROM (SELECT t_0_X.x AS synalog_v) AS synalog_n) AS v
FROM
  t_1_X AS t_0_X
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;
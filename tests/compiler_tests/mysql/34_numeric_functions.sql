-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Numbers AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      16 AS x
   UNION ALL
  
    SELECT
      25 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT * FROM (
SELECT
  Numbers.x AS x,
  SQRT(Numbers.x) AS sqrt_x,
  ABS(- ((1) * (Numbers.x))) AS abs_neg,
  ((Numbers.x) * (2)) AS doubled
FROM
  t_1_Numbers AS Numbers
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x)
SELECT * FROM (
SELECT
  Computed.x AS x,
  Computed.sqrt_x AS sqrt_x,
  Computed.abs_neg AS abs_neg,
  Computed.doubled AS doubled
FROM
  t_0_Computed AS Computed
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;
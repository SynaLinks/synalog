-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_RawData AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      10 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      20 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      40 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_Aggregated AS (SELECT
  SUM(((RawData.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  t_1_RawData AS RawData
WHERE
  (RawData.col1 > 15))
SELECT * FROM (
SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  (CAST(Aggregated.total AS DOUBLE) / NULLIF(Aggregated.count, 0)) AS avg
FROM
  t_0_Aggregated AS Aggregated
) AS UNUSED_TABLE_NAME ORDER BY total IS NULL, total;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      10 AS x
   UNION ALL
  
    SELECT
      'de' AS c,
      20 AS x
   UNION ALL
  
    SELECT
      'ca' AS c,
      5 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_Region AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'de' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'ca' AS c,
      'us' AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Region.r AS r,
  SUM(Sale.x) AS t
FROM
  t_0_Sale AS Sale, t_1_Region AS Region
WHERE
  (Region.c = Sale.c)
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY r IS NULL, r;
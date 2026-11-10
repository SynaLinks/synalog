-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Stock AS (SELECT * FROM (
  
    SELECT
      'north' AS warehouse,
      'bolt' AS item,
      120 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'nut' AS item,
      40 AS qty
   UNION ALL
  
    SELECT
      'north' AS warehouse,
      'gear' AS item,
      5 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'bolt' AS item,
      30 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'gear' AS item,
      12 AS qty
   UNION ALL
  
    SELECT
      'south' AS warehouse,
      'belt' AS item,
      7 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'nut' AS item,
      15 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'belt' AS item,
      2 AS qty
   UNION ALL
  
    SELECT
      'east' AS warehouse,
      'chain' AS item,
      9 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total AS (SELECT
  Stock.item AS item,
  SUM(Stock.qty) AS n
FROM
  t_1_Stock AS Stock
GROUP BY 1),
t_2_Reorder AS (SELECT * FROM (
  
    SELECT
      'bolt' AS item,
      100 AS level
   UNION ALL
  
    SELECT
      'nut' AS item,
      60 AS level
   UNION ALL
  
    SELECT
      'gear' AS item,
      10 AS level
   UNION ALL
  
    SELECT
      'belt' AS item,
      10 AS level
   UNION ALL
  
    SELECT
      'chain' AS item,
      5 AS level
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Total.item AS item,
  CASE WHEN (Total.n < Reorder.level) THEN 'low' ELSE 'ok' END AS status
FROM
  t_0_Total AS Total, t_2_Reorder AS Reorder
WHERE
  (Reorder.item = Total.item)
) AS UNUSED_TABLE_NAME ORDER BY item IS NULL, item, status IS NULL, status;
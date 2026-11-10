-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'a' AS "group",
      1 AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'b' AS "group",
      2 AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Line."order" AS "order",
  Line."group" AS "group",
  SUM(Line."select") AS total
FROM
  t_0_Line AS Line
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY "order" DESC;
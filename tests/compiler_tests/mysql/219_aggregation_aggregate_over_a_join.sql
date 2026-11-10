-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS pid,
      10 AS amount
   UNION ALL
  
    SELECT
      1 AS pid,
      20 AS amount
   UNION ALL
  
    SELECT
      2 AS pid,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  P.name AS name,
  SUM(O.amount) AS total
FROM
  t_0_P AS P, t_1_O AS O
WHERE
  (O.pid = P.id)
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y,
      1 AS id
   UNION ALL
  
    SELECT
      1 AS x,
      3 AS y,
      2 AS id
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.x = A.x) AND
  (B.y = A.y);
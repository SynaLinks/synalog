-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  JSON_ARRAYAGG(X.v) AS l
FROM
  t_3_X AS X
WHERE
  (X.k = 1))
SELECT
  JSON_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;
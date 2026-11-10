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
      1 AS k,
      JSON_OBJECT('v', null) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('v', 3) AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (JSON_VALUE(JSON_EXTRACT(A.r, '$."v"'), '$' RETURNING DOUBLE) IS null) AND
  (B.k = A.k);
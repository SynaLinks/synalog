-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      6 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_G AS (SELECT
  V.g AS g
FROM
  t_2_V AS V
GROUP BY 1),
t_3_Big AS (SELECT
  t_4_V.g AS g
FROM
  t_2_V AS t_4_V
WHERE
  (t_4_V.x > 4)
GROUP BY 1)
SELECT
  t_0_G.g AS g
FROM
  t_1_G AS t_0_G
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_3_Big AS Big
  WHERE
    (Big.g = t_0_G.g)) IS NULL);
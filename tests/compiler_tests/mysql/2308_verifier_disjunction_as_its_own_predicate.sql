-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_Other_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_V.x AS x
    FROM
      t_0_V AS t_3_V
    WHERE
      (t_3_V.x = 2)
   UNION ALL
  
    SELECT
      t_4_V.x AS x
    FROM
      t_0_V AS t_4_V
    WHERE
      (t_4_V.x = 3)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Other AS (SELECT
  Other_MultBodyAggAux.x AS x
FROM
  t_2_Other_MultBodyAggAux AS Other_MultBodyAggAux
GROUP BY 1)
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_1_Other AS Other
  WHERE
    (Other.x = V.x)) IS NULL);
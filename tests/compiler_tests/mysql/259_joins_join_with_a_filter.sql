-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.id AS id,
  B.v AS v
FROM
  t_0_B AS B, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_6
WHERE
  (B.id > 1) AND
  (JSON_VALUE(x_6.value, '$' RETURNING DOUBLE) = B.id);
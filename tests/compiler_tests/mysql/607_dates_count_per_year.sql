-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT * FROM (
SELECT
  SUBSTR((JSON_UNQUOTE(NULLIF(x_2.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin), 1, 4) AS y,
  SUM(1) AS n
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY('2024-01-01', '2023-05-05', '2024-12-31') AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_2
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY y IS NULL, y;
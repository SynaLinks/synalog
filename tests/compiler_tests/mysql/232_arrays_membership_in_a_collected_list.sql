-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_L AS (SELECT
  JSON_ARRAYAGG(JSON_VALUE(x_8.value, '$' RETURNING DOUBLE)) AS l
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_8)
SELECT * FROM (
SELECT
  JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) AS x
FROM
  t_1_L AS t_0_L, LATERAL (SELECT synalog_u.value FROM (SELECT t_0_L.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 3) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5
WHERE
  (JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) = JSON_VALUE(x_3.value, '$' RETURNING DOUBLE))
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;
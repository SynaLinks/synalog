-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_A AS (SELECT
  AVG(CAST(JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) AS DOUBLE)) AS a
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 4) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3)
SELECT
  (SELECT (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2)) / POWER(10, 2) + 0 END) FROM (SELECT t_0_A.a AS synalog_v) AS synalog_n) AS r
FROM
  t_1_A AS t_0_A;
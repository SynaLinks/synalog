-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_L AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(DISTINCT JSON_EXTRACT(JSON_ARRAY((JSON_UNQUOTE(NULLIF(x_3.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin)), '$[0]') ORDER BY JSON_EXTRACT(JSON_ARRAY((JSON_UNQUOTE(NULLIF(x_3.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin)), '$[0]') SEPARATOR ','), ']') AS JSON) AS l
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY('x', 'y', 'x') AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3)
SELECT
  JSON_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;
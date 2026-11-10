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
  (JSON_UNQUOTE(NULLIF(x_1.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS part
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT CAST(CONCAT('[', REPLACE(JSON_QUOTE('1|2|3'), SUBSTR(JSON_QUOTE('|'), 2, CHAR_LENGTH(JSON_QUOTE('|')) - 2), '","'), ']') AS JSON) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_1
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY part IS NULL, part;
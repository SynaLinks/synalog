-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  JSON_VALUE((CASE WHEN CAST('1' AS SIGNED) < 0 THEN NULL ELSE JSON_EXTRACT(JSON_ARRAY(10, 20, 30), CONCAT('$[', CAST('1' AS SIGNED), ']')) END), '$' RETURNING DOUBLE) AS e,
  (JSON_UNQUOTE(NULLIF((CASE WHEN CAST(SIGN(1.0e0) * FLOOR(ABS(1.0e0) + 0.5) AS SIGNED) < 0 THEN NULL ELSE JSON_EXTRACT(JSON_ARRAY('a', 'b'), CONCAT('$[', CAST(SIGN(1.0e0) * FLOOR(ABS(1.0e0) + 0.5) AS SIGNED), ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS f,
  JSON_VALUE((CASE WHEN CAST(5 AS SIGNED) < 0 THEN NULL ELSE JSON_EXTRACT(JSON_ARRAY(1), CONCAT('$[', CAST(5 AS SIGNED), ']')) END), '$' RETURNING DOUBLE) AS g;
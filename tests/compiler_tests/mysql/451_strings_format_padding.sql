-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  (CASE WHEN CHAR_LENGTH(CAST(CAST(42 AS SIGNED) AS CHAR)) >= 5 THEN CAST(CAST(42 AS SIGNED) AS CHAR) ELSE (CASE WHEN 42 < 0 THEN '-' || LPAD(SUBSTR(CAST(CAST(42 AS SIGNED) AS CHAR), 2), 4, '0') ELSE LPAD(CAST(CAST(42 AS SIGNED) AS CHAR), 5, '0') END) END) AS v;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  CASE WHEN (CAST(SUBSTR('2100-02-28', 6, 2) AS SIGNED) = 2) THEN CASE WHEN ((((MOD(CAST(SUBSTR('2100-02-28', 1, 4) AS SIGNED), NULLIF(4, 0))) = 0) AND ((MOD(CAST(SUBSTR('2100-02-28', 1, 4) AS SIGNED), NULLIF(100, 0))) != 0)) OR ((MOD(CAST(SUBSTR('2100-02-28', 1, 4) AS SIGNED), NULLIF(400, 0))) = 0)) THEN 29 ELSE 28 END ELSE JSON_VALUE((CASE WHEN ((CAST(SUBSTR('2100-02-28', 6, 2) AS SIGNED)) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(JSON_ARRAY(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), CONCAT('$[', ((CAST(SUBSTR('2100-02-28', 6, 2) AS SIGNED)) - (1)), ']')) END), '$' RETURNING DOUBLE) END AS n;
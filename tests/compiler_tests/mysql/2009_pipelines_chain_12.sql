-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) AS x
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_27
WHERE
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 12) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 11) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 10) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 9) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 8) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 7) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 6) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 5) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 4) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 3) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 2) AND
  (JSON_VALUE(x_27.value, '$' RETURNING DOUBLE) != 1);
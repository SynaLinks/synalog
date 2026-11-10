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
  JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) AS m,
  CASE WHEN (JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) = 2) THEN CASE WHEN ((((MOD(2023, NULLIF(4, 0))) = 0) AND ((MOD(2023, NULLIF(100, 0))) != 0)) OR ((MOD(2023, NULLIF(400, 0))) = 0)) THEN 29 ELSE 28 END ELSE JSON_VALUE((CASE WHEN ((JSON_VALUE(x_3.value, '$' RETURNING DOUBLE)) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(JSON_ARRAY(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31), CONCAT('$[', ((JSON_VALUE(x_3.value, '$' RETURNING DOUBLE)) - (1)), ']')) END), '$' RETURNING DOUBLE) END AS n
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(13, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 13) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
WHERE
  (JSON_VALUE(x_3.value, '$' RETURNING DOUBLE) > 0)
) AS UNUSED_TABLE_NAME ORDER BY m IS NULL, m;
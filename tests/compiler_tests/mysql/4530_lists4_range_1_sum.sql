-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  SUM(JSON_VALUE(x_0.value, '$' RETURNING DOUBLE)) AS s
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(1, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 1) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_0;
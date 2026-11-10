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
  1 AS n
FROM
  (SELECT CAST(UTC_DATE() AS CHAR) AS date) AS Today, (SELECT UTC_TIMESTAMP(3) AS timestamp) AS Now
WHERE
  (SUBSTR(CAST(Now.timestamp AS CHAR), 1, 10) = Today.date)
) AS UNUSED_TABLE_NAME ORDER BY n IS NULL, n;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Price AS (SELECT * FROM (
  
    SELECT
      'pen' AS item,
      1 AS p
   UNION ALL
  
    SELECT
      'book' AS item,
      9 AS p
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Price.item), '$[0]') ORDER BY Price.p IS NULL ASC, Price.p ASC SEPARATOR ','), ']') AS JSON), '$[0]') AS item
FROM
  t_1_Price AS Price;
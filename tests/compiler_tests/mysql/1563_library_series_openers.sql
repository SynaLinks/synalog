-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Sequel AS (SELECT * FROM (
  
    SELECT
      2 AS book,
      3 AS next
   UNION ALL
  
    SELECT
      4 AS book,
      5 AS next
   UNION ALL
  
    SELECT
      8 AS book,
      9 AS next
   UNION ALL
  
    SELECT
      1 AS book,
      2 AS next
  
) AS UNUSED_TABLE_NAME  ),
t_1_IsSequel AS (SELECT
  t_2_Sequel.next AS book
FROM
  t_0_Sequel AS t_2_Sequel
GROUP BY 1)
SELECT * FROM (
SELECT
  Sequel.book AS book
FROM
  t_0_Sequel AS Sequel
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_1_IsSequel AS IsSequel
  WHERE
    (IsSequel.book = Sequel.book)) IS NULL)
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY book IS NULL, book;
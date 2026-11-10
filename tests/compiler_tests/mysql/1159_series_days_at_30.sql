-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Reading AS (SELECT * FROM (
  
    SELECT
      1 AS day,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS day,
      12 AS value
   UNION ALL
  
    SELECT
      3 AS day,
      11 AS value
   UNION ALL
  
    SELECT
      4 AS day,
      15 AS value
   UNION ALL
  
    SELECT
      5 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      6 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      7 AS day,
      14 AS value
   UNION ALL
  
    SELECT
      8 AS day,
      20 AS value
   UNION ALL
  
    SELECT
      9 AS day,
      25 AS value
   UNION ALL
  
    SELECT
      10 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      11 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      12 AS day,
      30 AS value
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_Reading AS Reading
WHERE
  (Reading.value >= 30);
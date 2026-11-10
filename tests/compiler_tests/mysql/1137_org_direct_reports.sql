-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Manages.boss AS boss,
  SUM(1) AS n
FROM
  t_0_Manages AS Manages
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY boss IS NULL, boss, n IS NULL, n;
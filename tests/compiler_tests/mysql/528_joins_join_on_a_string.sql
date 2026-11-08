-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_City AS (SELECT * FROM (
  
    SELECT
      'fr' AS code,
      'paris' AS city
   UNION ALL
  
    SELECT
      'de' AS code,
      'berlin' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_City.code AS code,
  t_0_City.city AS city
FROM
  t_1_City AS t_0_City
WHERE
  ('fr' = t_0_City.code);
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_0_Shares AS (SELECT
  HasPhone.account AS a,
  t_1_HasPhone.account AS b
FROM
  t_2_HasPhone AS HasPhone, t_2_HasPhone AS t_1_HasPhone
WHERE
  (HasPhone.account != t_1_HasPhone.account) AND
  (t_1_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2)
SELECT * FROM (
SELECT
  Shares.b AS b
FROM
  t_0_Shares AS Shares
WHERE
  (Shares.a = 'a4')
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY b IS NULL, b;
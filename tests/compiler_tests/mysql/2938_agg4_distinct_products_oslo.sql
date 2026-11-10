-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'oslo' AS shop,
      '2026-01-03' AS day,
      'tea' AS product,
      2 AS qty,
      3.5e0 AS price
   UNION ALL
  
    SELECT
      2 AS id,
      'oslo' AS shop,
      '2026-01-17' AS day,
      'cake' AS product,
      null AS qty,
      4.0e0 AS price
   UNION ALL
  
    SELECT
      3 AS id,
      'rome' AS shop,
      '2026-02-02' AS day,
      'tea' AS product,
      5 AS qty,
      3.0e0 AS price
   UNION ALL
  
    SELECT
      4 AS id,
      'rome' AS shop,
      '2026-02-11' AS day,
      'coffee' AS product,
      1 AS qty,
      2.5e0 AS price
   UNION ALL
  
    SELECT
      5 AS id,
      'rome' AS shop,
      '2026-03-09' AS day,
      'cake' AS product,
      3 AS qty,
      4.5e0 AS price
   UNION ALL
  
    SELECT
      6 AS id,
      'lima' AS shop,
      '2026-03-21' AS day,
      'coffee' AS product,
      4 AS qty,
      2.0e0 AS price
   UNION ALL
  
    SELECT
      7 AS id,
      'lima' AS shop,
      '2026-01-30' AS day,
      'tea' AS product,
      null AS qty,
      3.25e0 AS price
   UNION ALL
  
    SELECT
      8 AS id,
      'oslo' AS shop,
      '2026-03-02' AS day,
      'coffee' AS product,
      6 AS qty,
      2.75e0 AS price
   UNION ALL
  
    SELECT
      9 AS id,
      'lima' AS shop,
      '2026-02-14' AS day,
      'cake' AS product,
      2 AS qty,
      5.0e0 AS price
  
) AS UNUSED_TABLE_NAME  )
SELECT
  COUNT(DISTINCT S.product) AS n
FROM
  t_0_S AS S
WHERE
  (S.shop = 'oslo');
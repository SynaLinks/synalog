-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'apple' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'Apple' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'banana' AS w
   UNION ALL
  
    SELECT
      4 AS id,
      'Zebra' AS w
   UNION ALL
  
    SELECT
      5 AS id,
      'zebra' AS w
   UNION ALL
  
    SELECT
      6 AS id,
      'éclair' AS w
   UNION ALL
  
    SELECT
      7 AS id,
      'Eclair' AS w
   UNION ALL
  
    SELECT
      8 AS id,
      '10' AS w
   UNION ALL
  
    SELECT
      9 AS id,
      '9' AS w
   UNION ALL
  
    SELECT
      10 AS id,
      'a b' AS w
   UNION ALL
  
    SELECT
      11 AS id,
      'a-b' AS w
   UNION ALL
  
    SELECT
      12 AS id,
      'a_b' AS w
   UNION ALL
  
    SELECT
      13 AS id,
      '' AS w
   UNION ALL
  
    SELECT
      14 AS id,
      'ä' AS w
   UNION ALL
  
    SELECT
      15 AS id,
      'z' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MIN(t_0_W.w) AS lo,
  MAX(t_0_W.w) AS hi
FROM
  t_1_W AS t_0_W;
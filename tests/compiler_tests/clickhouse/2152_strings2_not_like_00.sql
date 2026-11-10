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
      'a_c' AS w
   UNION ALL
  
    SELECT
      'abc' AS w
   UNION ALL
  
    SELECT
      '50%' AS w
   UNION ALL
  
    SELECT
      '500' AS w
   UNION ALL
  
    SELECT
      'x\\y' AS w
   UNION ALL
  
    SELECT
      '' AS w
   UNION ALL
  
    SELECT
      'Ab' AS w
   UNION ALL
  
    SELECT
      'a%c' AS w
   UNION ALL
  
    SELECT
      'aXc' AS w
   UNION ALL
  
    SELECT
      'ac' AS w
   UNION ALL
  
    SELECT
      'hello world' AS w
   UNION ALL
  
    SELECT
      '_x' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W
WHERE
  ((t_0_W.w LIKE 'a\\_c') = false) ORDER BY w;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Words AS (SELECT * FROM (
  
    SELECT
      'apple' AS word
   UNION ALL
  
    SELECT
      'banana' AS word
   UNION ALL
  
    SELECT
      'cherry' AS word
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  MAX(Words.word) AS synalog_value
FROM
  t_0_Words AS Words) AS longest ORDER BY longest;
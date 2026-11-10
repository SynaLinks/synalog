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
      'red green blue' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'red red' AS s
   UNION ALL
  
    SELECT
      3 AS id,
      'blue' AS s
   UNION ALL
  
    SELECT
      4 AS id,
      '' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.id AS id,
  (CASE WHEN 0 < 0 OR 0 >= length(splitByString(' ', ifNull(t_0_W.s, ''))) THEN NULL ELSE arrayElement(splitByString(' ', ifNull(t_0_W.s, '')), toInt64(0) + 1) END) AS w
FROM
  t_1_W AS t_0_W ORDER BY id, w;
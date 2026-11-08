-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      x_6 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2] AS x_6
   UNION ALL
  
    SELECT
      'b' AS src,
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.src AS src,
  SUM(1) AS n
FROM
  t_0_S AS S
GROUP BY 1 ORDER BY src;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ['a', 'b'] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      CAST([] AS Array(Nullable(String))) AS l
   UNION ALL
  
    SELECT
      3 AS k,
      CAST([] AS Array(Nullable(String))) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_S.k AS k,
  arrayStringConcat(t_0_S.l, '+') AS s
FROM
  t_1_S AS t_0_S ORDER BY k;
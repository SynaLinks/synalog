-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Total_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      2 AS t
   UNION ALL
  
    SELECT
      'a' AS k,
      3 AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Total_MultBodyAggAux.k AS k,
  SUM(Total_MultBodyAggAux.t) AS t
FROM
  t_0_Total_MultBodyAggAux AS Total_MultBodyAggAux
GROUP BY 1;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2, 3, 4] AS x_5
    WHERE
      (x_5 < 2)
   UNION ALL
  
    SELECT
      x_9 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2, 3, 4] AS x_9
    WHERE
      (x_9 > 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U_MultBodyAggAux.x AS x
FROM
  t_0_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY 1 ORDER BY x;
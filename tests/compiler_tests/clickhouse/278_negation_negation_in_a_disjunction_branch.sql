-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Banned AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Out_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2, 3] AS x_5
    WHERE
      NOT (x_5 IS NOT NULL AND CAST(x_5 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        Banned.x AS synalog_k0
      FROM
        t_1_Banned AS Banned
      GROUP BY 1) AS synalog_m))
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [1, 2, 3] AS x_11
    WHERE
      (x_11 = 3)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Out_MultBodyAggAux.x AS x
FROM
  t_0_Out_MultBodyAggAux AS Out_MultBodyAggAux
GROUP BY 1 ORDER BY x;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS k
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.n AS n
FROM
  t_0_P AS P
WHERE
  NOT (P.n IS NOT NULL AND CAST(P.n AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    t_1_P.n AS synalog_k0
  FROM
    t_0_P AS t_1_P
  WHERE
    (t_1_P.k = 1)
  GROUP BY 1) AS synalog_m));
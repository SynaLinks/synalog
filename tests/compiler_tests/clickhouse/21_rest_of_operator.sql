-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Data AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c,
      'x' AS d
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c,
      'y' AS d
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b,
      9 AS c,
      'z' AS d
  
) AS UNUSED_TABLE_NAME  ),
t_0_Subset AS (SELECT
  Data.c AS c,
  Data.d AS d
FROM
  t_1_Data AS Data ORDER BY d)
SELECT
  Subset.c AS c,
  Subset.d AS d
FROM
  t_0_Subset AS Subset ORDER BY d;
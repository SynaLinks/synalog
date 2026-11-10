-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Record AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      3 AS c
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b,
      6 AS c
  
) AS UNUSED_TABLE_NAME  ),
t_0_CopyAll AS (SELECT
  Record.*
FROM
  t_1_Record AS Record ORDER BY a)
SELECT
  CopyAll.a AS a,
  CopyAll.b AS b,
  CopyAll.c AS c
FROM
  t_0_CopyAll AS CopyAll ORDER BY a;
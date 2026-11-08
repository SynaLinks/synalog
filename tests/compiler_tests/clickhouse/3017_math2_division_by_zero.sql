-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      2 AS id,
      0 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      3 AS id,
      7.5 AS x,
      2 AS z
   UNION ALL
  
    SELECT
      4 AS id,
      -7.5 AS x,
      2 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  (t_0_V.x / NULLIF(t_0_V.z, 0)) AS v
FROM
  t_1_V AS t_0_V ORDER BY id;
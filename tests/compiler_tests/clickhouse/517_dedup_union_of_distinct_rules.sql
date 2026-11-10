-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  V.x AS x
FROM
  t_2_V AS V
GROUP BY 1),
t_3_B AS (SELECT
  t_4_V.x AS x
FROM
  t_2_V AS t_4_V
GROUP BY 1),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_1_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;
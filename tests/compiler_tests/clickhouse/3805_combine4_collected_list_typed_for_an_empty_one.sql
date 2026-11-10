-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_4_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  'a' AS src,
  arrayMap(t -> t.1, groupArray(tuple(A.x))) AS l
FROM
  t_4_A AS A
GROUP BY 1),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      'b' AS src,
      CAST([] AS Array(Nullable(Float64))) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  length(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;
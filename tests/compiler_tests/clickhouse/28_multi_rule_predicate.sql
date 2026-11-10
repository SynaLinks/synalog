-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(5, 0)))) AS x_8
   UNION ALL
  
    SELECT
      x_10 AS col0
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [10, 11, 12, 13, 14] AS x_10
  
) AS UNUSED_TABLE_NAME  ),
t_0_Category AS (SELECT * FROM (
  
    SELECT
      Number.col0 AS col0,
      'small' AS col1
    FROM
      t_1_Number AS Number
    WHERE
      (Number.col0 < 5)
   UNION ALL
  
    SELECT
      t_2_Number.col0 AS col0,
      'medium' AS col1
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (t_2_Number.col0 >= 5) AND
      (t_2_Number.col0 < 10)
   UNION ALL
  
    SELECT
      t_3_Number.col0 AS col0,
      'large' AS col1
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (t_3_Number.col0 >= 10)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Category.col0 AS col0,
  Category.col1 AS col1
FROM
  t_0_Category AS Category ORDER BY col0;
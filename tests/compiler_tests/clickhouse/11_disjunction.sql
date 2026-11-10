-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Classification AS (SELECT * FROM (
  
    SELECT
      x_8 AS col0,
      'small' AS col1
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_8
    WHERE
      (x_8 < 3)
   UNION ALL
  
    SELECT
      x_13 AS col0,
      'medium' AS col1
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_13
    WHERE
      (x_13 >= 3) AND
      (x_13 < 7)
   UNION ALL
  
    SELECT
      x_18 AS col0,
      'large' AS col1
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_18
    WHERE
      (x_18 >= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 )
SELECT
  Classification.col0 AS col0,
  Classification.col1 AS col1
FROM
  t_0_Classification AS Classification ORDER BY col0;
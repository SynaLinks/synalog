-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

SELECT * FROM (
  
    SELECT
      'equal' AS test_name,
      5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (5 = x_5)
   UNION ALL
  
    SELECT
      'not_equal' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (x_5 != 5)
   UNION ALL
  
    SELECT
      'less_than' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (x_5 < 5)
   UNION ALL
  
    SELECT
      'in_range' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (x_5 >= 3) AND
      (x_5 <= 7)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;
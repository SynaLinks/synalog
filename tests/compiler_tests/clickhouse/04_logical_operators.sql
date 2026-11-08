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
      'and' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      ((x_5 > 2) AND (x_5 < 7))
   UNION ALL
  
    SELECT
      'complex' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (((x_5 > 2) AND (x_5 < 4)) OR ((x_5 > 6) AND (x_5 < 9)))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;
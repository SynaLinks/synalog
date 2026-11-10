-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Data AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'alice@example.com' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      null AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      null AS col1,
      'charlie@example.com' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      null AS col1,
      null AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Data.col0 AS id,
  COALESCE(Data.col1, 'Unknown') AS display_name
FROM
  t_0_Data AS Data ORDER BY id;
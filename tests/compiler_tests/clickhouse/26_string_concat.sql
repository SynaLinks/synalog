-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'John' AS col0,
      'Doe' AS col1
   UNION ALL
  
    SELECT
      'Jane' AS col0,
      'Smith' AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      '' AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  (concat((concat(Person.col0, ' ')), Person.col1)) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Employee AS (SELECT * FROM (
  
    SELECT
      'Alice' AS name,
      'Engineering' AS department,
      75000 AS salary
   UNION ALL
  
    SELECT
      'Bob' AS name,
      'Marketing' AS department,
      65000 AS salary
   UNION ALL
  
    SELECT
      'Charlie' AS name,
      'Engineering' AS department,
      80000 AS salary
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Employee.name AS name
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = 'Engineering') ORDER BY name;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Users AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      'Alice' AS col1,
      'admin' AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'Bob' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'Charlie' AS col1,
      'user' AS col2
   UNION ALL
  
    SELECT
      4 AS col0,
      'Diana' AS col1,
      'guest' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      100 AS col1
   UNION ALL
  
    SELECT
      1 AS col0,
      200 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Users.col0 AS id,
  Users.col1 AS name
FROM
  t_0_Users AS Users
WHERE
  NOT (Users.col0 IS NOT NULL AND CAST(Users.col0 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Orders.col0 AS synalog_k0
  FROM
    t_1_Orders AS Orders
  GROUP BY 1) AS synalog_m)) ORDER BY id;
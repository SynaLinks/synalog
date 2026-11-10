-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_Orders AS (SELECT * FROM (
  
    SELECT
      'John' AS customer_name,
      10 AS amount
   UNION ALL
  
    SELECT
      'John' AS customer_name,
      20 AS amount
   UNION ALL
  
    SELECT
      'Mary' AS customer_name,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filter AS (SELECT
  t_1_Orders.customer_name AS customer_name
FROM
  t_2_Orders AS t_1_Orders
GROUP BY 1)
SELECT
  Filter.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Filter AS Filter, t_2_Orders AS Orders
WHERE
  (Orders.customer_name = Filter.customer_name)
GROUP BY 1 ORDER BY customer_name;
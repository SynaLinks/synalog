-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Orders AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Orders.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Orders AS Orders
WHERE
  ('John' = Orders.customer_name)
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY customer_name IS NULL, customer_name;
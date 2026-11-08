-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Transactions AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      'purchase' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Alice' AS col0,
      'purchase' AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      'Alice' AS col0,
      'refund' AS col1,
      30 AS col2
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      'purchase' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      'purchase' AS col1,
      75 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'purchase' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'refund' AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      'purchase' AS col1,
      100 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_CustomerStats AS (SELECT
  Transactions.col0 AS col0,
  SUM(Transactions.col2) AS total,
  SUM(1) AS count,
  MAX(Transactions.col2) AS max_txn,
  MIN(Transactions.col2) AS min_txn,
  AVG(CAST(Transactions.col2 AS DOUBLE)) AS avg_txn
FROM
  t_1_Transactions AS Transactions
GROUP BY 1)
SELECT * FROM (
SELECT
  CustomerStats.col0 AS customer,
  CustomerStats.total AS total,
  CustomerStats.count AS count,
  CustomerStats.max_txn AS max_txn
FROM
  t_0_CustomerStats AS CustomerStats
) AS UNUSED_TABLE_NAME ORDER BY customer IS NULL, customer;
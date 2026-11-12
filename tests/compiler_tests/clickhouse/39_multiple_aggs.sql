-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;
CREATE DATABASE IF NOT EXISTS synalog_home;

DROP TABLE IF EXISTS synalog_home.CustomerStats;
CREATE TABLE synalog_home.CustomerStats ENGINE = Memory AS WITH t_0_Transactions AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Transactions.col0 AS col0,
  SUM(Transactions.col2) AS total,
  SUM(1) AS count,
  MAX(Transactions.col2) AS max_txn,
  MIN(Transactions.col2) AS min_txn,
  AVG(Transactions.col2) AS avg_txn
FROM
  t_0_Transactions AS Transactions
GROUP BY 1;

-- Interacting with table synalog_home.CustomerStats

SELECT
  CustomerStats.col0 AS customer,
  CustomerStats.total AS total,
  CustomerStats.count AS count,
  CustomerStats.max_txn AS max_txn
FROM
  synalog_home.CustomerStats AS CustomerStats ORDER BY customer;
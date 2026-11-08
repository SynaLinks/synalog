-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;
CREATE DATABASE IF NOT EXISTS synalog_test;

DROP TABLE IF EXISTS synalog_test.BestQuarter;
CREATE TABLE synalog_test.BestQuarter ENGINE = Memory AS WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS col0,
      'Q1' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q2' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q3' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q1' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q2' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q3' AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q1' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q2' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q3' AS col1,
      95 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  argMax(Sales.col1, Sales.col2) AS best_quarter
FROM
  t_1_Sales AS Sales
GROUP BY 1;

-- Interacting with table synalog_test.BestQuarter

SELECT
  BestQuarter.col0 AS region,
  BestQuarter.best_quarter AS best_quarter
FROM
  synalog_test.BestQuarter AS BestQuarter ORDER BY region;
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

DROP TABLE IF EXISTS synalog_home.QuarterTotals;
CREATE TABLE synalog_home.QuarterTotals ENGINE = Memory AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table synalog_home.QuarterTotals

DROP TABLE IF EXISTS synalog_home.RegionTotals;
CREATE TABLE synalog_home.RegionTotals ENGINE = Memory AS WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col1 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_0_Sales AS Sales
GROUP BY 1;

-- Interacting with table synalog_home.RegionTotals

WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'Q1' AS col0,
      'North' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'Q1' AS col0,
      'South' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'North' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'Q2' AS col0,
      'South' AS col1,
      180 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sales.col0 AS quarter,
  Sales.col1 AS region,
  QuarterTotals.total AS qtotal,
  RegionTotals.total AS rtotal
FROM
  t_0_Sales AS Sales, synalog_home.QuarterTotals AS QuarterTotals, synalog_home.RegionTotals AS RegionTotals
WHERE
  (QuarterTotals.col0 = Sales.col0) AND
  (RegionTotals.col0 = Sales.col1) ORDER BY quarter, region;
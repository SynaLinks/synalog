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

DROP TABLE IF EXISTS synalog_test.Day;
CREATE TABLE synalog_test.Day ENGINE = Memory AS WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.d AS d
FROM
  t_0_S AS S
GROUP BY 1;

-- Interacting with table synalog_test.Day

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_Region AS (SELECT
  S.r AS r
FROM
  t_0_S AS S
GROUP BY 1),
t_0_Missing AS (SELECT
  t_1_Day.d AS d
FROM
  synalog_test.Day AS t_1_Day, t_2_Region AS Region
WHERE
  NOT (Region.r IS NOT NULL AND t_1_Day.d IS NOT NULL AND (CAST(Region.r AS Nullable(String)), CAST(t_1_Day.d AS Nullable(String))) IN (SELECT CAST(synalog_k0 AS Nullable(String)), CAST(synalog_k1 AS Nullable(String)) FROM (SELECT
    t_3_S.r AS synalog_k0,
    t_3_S.d AS synalog_k1
  FROM
    t_0_S AS t_3_S
  GROUP BY 1, 2) AS synalog_m))
GROUP BY 1)
SELECT
  Day.d AS d
FROM
  synalog_test.Day AS Day
WHERE
  NOT (Day.d IS NOT NULL AND CAST(Day.d AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
    Missing.d AS synalog_k0
  FROM
    t_0_Missing AS Missing
  GROUP BY 1) AS synalog_m)) ORDER BY d;
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

DROP TABLE IF EXISTS synalog_home.Filtered;
CREATE TABLE synalog_home.Filtered ENGINE = Memory AS WITH t_0_RawData AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      10 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      20 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      40 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  RawData.col0 AS col0,
  RawData.col1 AS col1
FROM
  t_0_RawData AS RawData
WHERE
  (RawData.col1 > 15);

-- Interacting with table synalog_home.Filtered

DROP TABLE IF EXISTS synalog_home.Aggregated;
CREATE TABLE synalog_home.Aggregated ENGINE = Memory AS SELECT
  SUM(((Filtered.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  synalog_home.Filtered AS Filtered;

-- Interacting with table synalog_home.Aggregated

SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  (Aggregated.total / NULLIF(Aggregated.count, 0)) AS avg
FROM
  synalog_home.Aggregated AS Aggregated ORDER BY total;
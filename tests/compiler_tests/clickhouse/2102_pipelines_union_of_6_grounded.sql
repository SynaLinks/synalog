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

DROP TABLE IF EXISTS synalog_test.W;
CREATE TABLE synalog_test.W ENGINE = Memory AS WITH t_0_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [0, 1] AS x_3
   UNION ALL
  
    SELECT
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [2, 3] AS x_5
   UNION ALL
  
    SELECT
      x_7 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [4, 5] AS x_7
   UNION ALL
  
    SELECT
      x_9 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [6, 7] AS x_9
   UNION ALL
  
    SELECT
      x_11 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [8, 9] AS x_11
   UNION ALL
  
    SELECT
      x_13 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN [10, 11] AS x_13
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_0_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1;

-- Interacting with table synalog_test.W

SELECT
  SUM(1) AS n
FROM
  synalog_test.W AS W;
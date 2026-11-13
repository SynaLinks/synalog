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

DROP TABLE IF EXISTS synalog_home.G;
CREATE TABLE synalog_home.G ENGINE = MergeTree ORDER BY tuple() AS WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.n AS n
FROM
  t_0_N AS N
WHERE
  (N.n > 1);

-- Interacting with table synalog_home.G

SELECT
  SUM(1) AS c
FROM
  synalog_home.G AS G;
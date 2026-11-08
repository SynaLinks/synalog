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

DROP TABLE IF EXISTS synalog_test.Even;
CREATE TABLE synalog_test.Even ENGINE = Memory AS SELECT
  x_3 AS col0
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_3
WHERE
  (((x_3) % NULLIF(2, 0)) = 0);

-- Interacting with table synalog_test.Even

DROP TABLE IF EXISTS synalog_test.Odd;
CREATE TABLE synalog_test.Odd ENGINE = Memory AS SELECT
  x_3 AS col0
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_3
WHERE
  (((x_3) % NULLIF(2, 0)) = 1);

-- Interacting with table synalog_test.Odd

WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      Even.col0 AS x,
      ((Even.col0) * (Even.col0)) AS sq,
      'even' AS type
    FROM
      synalog_test.Even AS Even
   UNION ALL
  
    SELECT
      Odd.col0 AS x,
      ((Odd.col0) * (Odd.col0)) AS sq,
      'odd' AS type
    FROM
      synalog_test.Odd AS Odd
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x;
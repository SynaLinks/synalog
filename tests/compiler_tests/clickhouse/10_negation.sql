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

DROP TABLE IF EXISTS synalog_home.Even;
CREATE TABLE synalog_home.Even ENGINE = Memory AS SELECT
  x_3 AS col0
FROM
  (SELECT 'singleton' as s) as unused_singleton
  ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_3
WHERE
  (((x_3) % NULLIF(2, 0)) = 0);

-- Interacting with table synalog_home.Even

WITH t_0_Prime AS (SELECT * FROM (
  
    SELECT
      2 AS col0
   UNION ALL
  
    SELECT
      3 AS col0
   UNION ALL
  
    SELECT
      5 AS col0
   UNION ALL
  
    SELECT
      7 AS col0
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      'odd' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      NOT (x_5 IS NOT NULL AND CAST(x_5 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        Even.col0 AS synalog_k0
      FROM
        synalog_home.Even AS Even
      GROUP BY 1) AS synalog_m))
   UNION ALL
  
    SELECT
      'not_prime' AS test_name,
      x_5 AS x
    FROM
      (SELECT 'singleton' as s) as unused_singleton
      ARRAY JOIN arrayMap(x -> toInt64(x), range(toUInt64(greatest(10, 0)))) AS x_5
    WHERE
      (x_5 > 1) AND
      NOT (x_5 IS NOT NULL AND CAST(x_5 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        Prime.col0 AS synalog_k0
      FROM
        t_0_Prime AS Prime
      GROUP BY 1) AS synalog_m))
   UNION ALL
  
    SELECT
      'even_not_prime' AS test_name,
      Even.col0 AS x
    FROM
      synalog_home.Even AS Even
    WHERE
      NOT (Even.col0 IS NOT NULL AND CAST(Even.col0 AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        Prime.col0 AS synalog_k0
      FROM
        t_0_Prime AS Prime
      GROUP BY 1) AS synalog_m))
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name, x ;
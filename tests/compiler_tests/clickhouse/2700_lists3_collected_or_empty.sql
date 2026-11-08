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

DROP TABLE IF EXISTS synalog_test.C;
CREATE TABLE synalog_test.C ENGINE = Memory AS WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  arrayMap(t -> t.1, groupArray(tuple(V.x))) AS l
FROM
  t_0_V AS V
GROUP BY 1;

-- Interacting with table synalog_test.C

WITH t_3_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      C.g AS g,
      C.l AS l
    FROM
      synalog_test.C AS C
   UNION ALL
  
    SELECT
      t_2_G.g AS g,
      CAST([] AS Array(Nullable(Float64))) AS l
    FROM
      t_3_G AS t_2_G
    WHERE
      NOT (t_2_G.g IS NOT NULL AND CAST(t_2_G.g AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        t_4_C.g AS synalog_k0
      FROM
        synalog_test.C AS t_4_C
      GROUP BY 1) AS synalog_m))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.g AS g,
  length(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g;
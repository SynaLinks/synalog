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

DROP TABLE IF EXISTS synalog_home.L;
CREATE TABLE synalog_home.L ENGINE = Memory AS WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_L_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS l
    FROM
      t_1_A AS A
    WHERE
      (A.x <= 2)
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS l
    FROM
      t_2_B AS B
    WHERE
      (B.x <= 2)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  L_MultBodyAggAux.src AS src,
  arrayMap(t -> t.1, groupArray(tuple(L_MultBodyAggAux.l))) AS l
FROM
  t_0_L_MultBodyAggAux AS L_MultBodyAggAux
GROUP BY 1;

-- Interacting with table synalog_home.L

WITH t_3_M AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      CAST([] AS Array(Nullable(Float64))) AS l
   UNION ALL
  
    SELECT
      'b' AS src,
      CAST([] AS Array(Nullable(Float64))) AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      synalog_home.L AS t_2_L
   UNION ALL
  
    SELECT
      M.src AS src,
      M.l AS l
    FROM
      t_3_M AS M
    WHERE
      NOT (M.src IS NOT NULL AND CAST(M.src AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        t_4_L.src AS synalog_k0
      FROM
        synalog_home.L AS t_4_L
      GROUP BY 1) AS synalog_m))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  length(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;
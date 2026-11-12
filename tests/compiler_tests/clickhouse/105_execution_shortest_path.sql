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

DROP TABLE IF EXISTS synalog_home.Dist_ifr0;
CREATE TABLE synalog_home.Dist_ifr0 ENGINE = Memory AS WITH t_0_Dist_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f1.node AS node,
  MIN(Dist_MultBodyAggAux_f1.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f1 AS Dist_MultBodyAggAux_f1
GROUP BY 1;

-- Interacting with table synalog_home.Dist_ifr0

DROP TABLE IF EXISTS synalog_home.Dist_ifr1;
CREATE TABLE synalog_home.Dist_ifr1 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr0.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr0 AS Dist_ifr0, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr0.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f2.node AS node,
  MIN(Dist_MultBodyAggAux_f2.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f2 AS Dist_MultBodyAggAux_f2
GROUP BY 1;

-- Interacting with table synalog_home.Dist_ifr1

DROP TABLE IF EXISTS synalog_home.Dist_ifr2;
CREATE TABLE synalog_home.Dist_ifr2 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr1 AS Dist_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr1.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.node AS node,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

-- Interacting with table synalog_home.Dist_ifr2

DROP TABLE IF EXISTS synalog_home.Dist_ifr1;
CREATE TABLE synalog_home.Dist_ifr1 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr2 AS Dist_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.node AS node,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

-- Interacting with table synalog_home.Dist_ifr1

DROP TABLE IF EXISTS synalog_home.Dist_ifr2;
CREATE TABLE synalog_home.Dist_ifr2 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr1 AS Dist_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr1.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.node AS node,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS synalog_home.Dist_ifr1;
CREATE TABLE synalog_home.Dist_ifr1 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr2 AS Dist_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.node AS node,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS synalog_home.Dist_ifr2;
CREATE TABLE synalog_home.Dist_ifr2 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr1 AS Dist_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr1.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.node AS node,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS synalog_home.Dist_ifr1;
CREATE TABLE synalog_home.Dist_ifr1 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr2 AS Dist_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.node AS node,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

DROP TABLE IF EXISTS synalog_home.Dist_ifr2;
CREATE TABLE synalog_home.Dist_ifr2 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr1.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr1 AS Dist_ifr1, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr1.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f3.node AS node,
  MIN(Dist_MultBodyAggAux_f3.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f3 AS Dist_MultBodyAggAux_f3
GROUP BY 1;

DROP TABLE IF EXISTS synalog_home.Dist_ifr1;
CREATE TABLE synalog_home.Dist_ifr1 ENGINE = Memory AS WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr2.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr2 AS Dist_ifr2, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr2.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f4.node AS node,
  MIN(Dist_MultBodyAggAux_f4.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f4 AS Dist_MultBodyAggAux_f4
GROUP BY 1;

WITH t_1_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'a' AS x,
      'd' AS y
   UNION ALL
  
    SELECT
      'd' AS x,
      'c' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Dist_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      'a' AS node,
      0 AS d
   UNION ALL
  
    SELECT
      Edge.y AS node,
      ((Dist_ifr3.d) + (1)) AS d
    FROM
      synalog_home.Dist_ifr1 AS Dist_ifr3, t_1_Edge AS Edge
    WHERE
      (Edge.x = Dist_ifr3.node)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Dist_MultBodyAggAux_f5.node AS node,
  MIN(Dist_MultBodyAggAux_f5.d) AS d
FROM
  t_0_Dist_MultBodyAggAux_f5 AS Dist_MultBodyAggAux_f5
GROUP BY 1 ORDER BY node;
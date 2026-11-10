-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_test DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_test.Path_ifr0;
CREATE TABLE synalog_test.Path_ifr0 AS WITH t_0_Path_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f1.a AS a,
  Path_MultBodyAggAux_f1.b AS b
FROM
  t_0_Path_MultBodyAggAux_f1 AS Path_MultBodyAggAux_f1
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path_ifr0

DROP TABLE IF EXISTS synalog_test.Path_ifr1;
CREATE TABLE synalog_test.Path_ifr1 AS WITH t_0_Path_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      Path_ifr0.a AS a,
      t_1_Path_ifr0.b AS b
    FROM
      synalog_test.Path_ifr0 AS Path_ifr0, synalog_test.Path_ifr0 AS t_1_Path_ifr0
    WHERE
      (t_1_Path_ifr0.a = Path_ifr0.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f2.a AS a,
  Path_MultBodyAggAux_f2.b AS b
FROM
  t_0_Path_MultBodyAggAux_f2 AS Path_MultBodyAggAux_f2
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path_ifr1

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      Path_ifr1.a AS a,
      t_1_Path_ifr1.b AS b
    FROM
      synalog_test.Path_ifr1 AS Path_ifr1, synalog_test.Path_ifr1 AS t_1_Path_ifr1
    WHERE
      (t_1_Path_ifr1.a = Path_ifr1.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f3.a AS a,
  Path_MultBodyAggAux_f3.b AS b
FROM
  t_0_Path_MultBodyAggAux_f3 AS Path_MultBodyAggAux_f3
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path_ifr2

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path_ifr3

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path_ifr2

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr3;
CREATE TABLE synalog_test.Path_ifr3 AS WITH t_0_Path_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      Path_ifr2.a AS a,
      t_1_Path_ifr2.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr2, synalog_test.Path_ifr2 AS t_1_Path_ifr2
    WHERE
      (t_1_Path_ifr2.a = Path_ifr2.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f4.a AS a,
  Path_MultBodyAggAux_f4.b AS b
FROM
  t_0_Path_MultBodyAggAux_f4 AS Path_MultBodyAggAux_f4
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path_ifr2;
CREATE TABLE synalog_test.Path_ifr2 AS WITH t_0_Path_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      Path_ifr3.a AS a,
      t_1_Path_ifr3.b AS b
    FROM
      synalog_test.Path_ifr3 AS Path_ifr3, synalog_test.Path_ifr3 AS t_1_Path_ifr3
    WHERE
      (t_1_Path_ifr3.a = Path_ifr3.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f5.a AS a,
  Path_MultBodyAggAux_f5.b AS b
FROM
  t_0_Path_MultBodyAggAux_f5 AS Path_MultBodyAggAux_f5
GROUP BY 1, 2;

DROP TABLE IF EXISTS synalog_test.Path;
CREATE TABLE synalog_test.Path AS WITH t_0_Path_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      Path_ifr4.a AS a,
      t_1_Path_ifr4.b AS b
    FROM
      synalog_test.Path_ifr2 AS Path_ifr4, synalog_test.Path_ifr2 AS t_1_Path_ifr4
    WHERE
      (t_1_Path_ifr4.a = Path_ifr4.b)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS a,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) + (1)) AS b
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(9, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 9) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Path_MultBodyAggAux_f6.a AS a,
  Path_MultBodyAggAux_f6.b AS b
FROM
  t_0_Path_MultBodyAggAux_f6 AS Path_MultBodyAggAux_f6
GROUP BY 1, 2;

-- Interacting with table synalog_test.Path

SELECT
  SUM(1) AS n
FROM
  synalog_test.Path AS Path;
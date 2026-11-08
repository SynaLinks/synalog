-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_A AS (SELECT * FROM (
  
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
t_0_U AS (SELECT * FROM (
  
    SELECT
      (SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT A.x AS synalog_v) AS synalog_n) AS s
    FROM
      t_1_A AS A
    WHERE
      (A.x <= 2)
   UNION ALL
  
    SELECT
      (CONCAT((SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT B.x AS synalog_v) AS synalog_n), '*')) AS s
    FROM
      t_2_B AS B
    WHERE
      (B.x <= 2)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  U.s AS s
FROM
  t_0_U AS U
) AS UNUSED_TABLE_NAME ORDER BY s IS NULL, s;
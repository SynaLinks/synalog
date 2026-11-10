-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'AB-001' AS code,
      'north' AS zone,
      12.5e0 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      'AB-017' AS code,
      'south' AS zone,
      -3.75e0 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      'XY-200' AS code,
      'north' AS zone,
      0.0e0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      'XY-031' AS code,
      'east' AS zone,
      7.0e0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      'QZ-999' AS code,
      'south' AS zone,
      -12.25e0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      'AB-120' AS code,
      'east' AS zone,
      99.9e0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  C.id AS id,
  LPAD((SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT C.id AS synalog_v) AS synalog_n), 4, '0') AS s
FROM
  t_0_C AS C
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id, s IS NULL, s;
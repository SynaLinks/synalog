-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  B.title AS title,
  (CONCAT((CONCAT((CONCAT(B.title, ' (')), (SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT B.year AS synalog_v) AS synalog_n))), ')')) AS label
FROM
  t_1_B AS B
) AS UNUSED_TABLE_NAME ORDER BY title IS NULL, title, label IS NULL, label;
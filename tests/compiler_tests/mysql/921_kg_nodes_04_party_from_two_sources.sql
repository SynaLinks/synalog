-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Employees AS (SELECT * FROM (
  
    SELECT
      1 AS person_id,
      'ann' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/ann' AS url
   UNION ALL
  
    SELECT
      2 AS person_id,
      'bob' AS name,
      'eng' AS dept,
      10 AS team_id,
      'active' AS status,
      'https://x/bob' AS url
   UNION ALL
  
    SELECT
      3 AS person_id,
      'cid' AS name,
      'ops' AS dept,
      20 AS team_id,
      'inactive' AS status,
      'https://x/cid' AS url
   UNION ALL
  
    SELECT
      4 AS person_id,
      'dan' AS name,
      'ops' AS dept,
      20 AS team_id,
      'active' AS status,
      'https://x/dan' AS url
   UNION ALL
  
    SELECT
      5 AS person_id,
      'eve' AS name,
      'eng' AS dept,
      30 AS team_id,
      'active' AS status,
      'https://x/eve' AS url
  
) AS UNUSED_TABLE_NAME  ),
t_2_Contractors AS (SELECT * FROM (
  
    SELECT
      1 AS contractor_id,
      'zoe' AS name
   UNION ALL
  
    SELECT
      2 AS contractor_id,
      'yan' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_Party_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      (CONCAT('employee:', (SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT Employees.person_id AS synalog_v) AS synalog_n))) AS party_id,
      Employees.name AS name,
      'employee' AS kind
    FROM
      t_1_Employees AS Employees
   UNION ALL
  
    SELECT
      (CONCAT('contractor:', (SELECT CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS SIGNED) AS CHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS CHAR) WHEN ABS(synalog_v) < 1 THEN (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15) AS CHAR) AS synalog_s) AS synalog_m) ELSE (SELECT CASE WHEN LOCATE('.', synalog_s) > 0 THEN TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)) ELSE synalog_s END FROM (SELECT CAST(ROUND(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)), 15 - LENGTH(CAST(FLOOR(ABS(CAST(CAST(synalog_v AS CHAR) AS DECIMAL(65,26)))) AS CHAR))) AS CHAR) AS synalog_s) AS synalog_m) END FROM (SELECT Contractors.contractor_id AS synalog_v) AS synalog_n))) AS party_id,
      Contractors.name AS name,
      'contractor' AS kind
    FROM
      t_2_Contractors AS Contractors
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Party_MultBodyAggAux.party_id AS party_id,
  Party_MultBodyAggAux.name AS name,
  Party_MultBodyAggAux.kind AS kind
FROM
  t_0_Party_MultBodyAggAux AS Party_MultBodyAggAux
GROUP BY 1, 2, 3
) AS UNUSED_TABLE_NAME ORDER BY party_id IS NULL, party_id;
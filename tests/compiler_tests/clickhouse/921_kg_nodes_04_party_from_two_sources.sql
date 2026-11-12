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
      (concat('employee:', arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS DECIMAL(38,0)) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN arrayElement(arrayMap(synalog_s -> if(position(synalog_s, '.') > 0, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)), synalog_s), [CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR)]), 1) WHEN ABS(synalog_v) < 1e18 THEN arrayElement(arrayMap(synalog_t -> arrayElement(arrayMap(synalog_s -> if(position(synalog_s, '.') > 0, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)), synalog_s), [CAST(CASE LENGTH(CAST(CAST(FLOOR(ABS(synalog_t)) AS BIGINT) AS VARCHAR)) WHEN 1 THEN CAST(ROUND(synalog_t, 14) AS DECIMAL(38,20)) WHEN 2 THEN CAST(ROUND(synalog_t, 13) AS DECIMAL(38,20)) WHEN 3 THEN CAST(ROUND(synalog_t, 12) AS DECIMAL(38,20)) WHEN 4 THEN CAST(ROUND(synalog_t, 11) AS DECIMAL(38,20)) WHEN 5 THEN CAST(ROUND(synalog_t, 10) AS DECIMAL(38,20)) WHEN 6 THEN CAST(ROUND(synalog_t, 9) AS DECIMAL(38,20)) WHEN 7 THEN CAST(ROUND(synalog_t, 8) AS DECIMAL(38,20)) WHEN 8 THEN CAST(ROUND(synalog_t, 7) AS DECIMAL(38,20)) WHEN 9 THEN CAST(ROUND(synalog_t, 6) AS DECIMAL(38,20)) WHEN 10 THEN CAST(ROUND(synalog_t, 5) AS DECIMAL(38,20)) WHEN 11 THEN CAST(ROUND(synalog_t, 4) AS DECIMAL(38,20)) WHEN 12 THEN CAST(ROUND(synalog_t, 3) AS DECIMAL(38,20)) WHEN 13 THEN CAST(ROUND(synalog_t, 2) AS DECIMAL(38,20)) WHEN 14 THEN CAST(ROUND(synalog_t, 1) AS DECIMAL(38,20)) WHEN 15 THEN CAST(ROUND(synalog_t, 0) AS DECIMAL(38,20)) WHEN 16 THEN CAST(ROUND(synalog_t, -1) AS DECIMAL(38,20)) WHEN 17 THEN CAST(ROUND(synalog_t, -2) AS DECIMAL(38,20)) WHEN 18 THEN CAST(ROUND(synalog_t, -3) AS DECIMAL(38,20)) END AS VARCHAR)]), 1), [CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20))]), 1) ELSE arrayElement(arrayMap(synalog_t -> CAST(CASE LENGTH(CAST(ABS(synalog_t) AS VARCHAR)) WHEN 19 THEN CAST(ROUND(synalog_t, -4) AS DECIMAL(38,0)) WHEN 20 THEN CAST(ROUND(synalog_t, -5) AS DECIMAL(38,0)) WHEN 21 THEN CAST(ROUND(synalog_t, -6) AS DECIMAL(38,0)) WHEN 22 THEN CAST(ROUND(synalog_t, -7) AS DECIMAL(38,0)) WHEN 23 THEN CAST(ROUND(synalog_t, -8) AS DECIMAL(38,0)) WHEN 24 THEN CAST(ROUND(synalog_t, -9) AS DECIMAL(38,0)) WHEN 25 THEN CAST(ROUND(synalog_t, -10) AS DECIMAL(38,0)) WHEN 26 THEN CAST(ROUND(synalog_t, -11) AS DECIMAL(38,0)) WHEN 27 THEN CAST(ROUND(synalog_t, -12) AS DECIMAL(38,0)) WHEN 28 THEN CAST(ROUND(synalog_t, -13) AS DECIMAL(38,0)) WHEN 29 THEN CAST(ROUND(synalog_t, -14) AS DECIMAL(38,0)) WHEN 30 THEN CAST(ROUND(synalog_t, -15) AS DECIMAL(38,0)) WHEN 31 THEN CAST(ROUND(synalog_t, -16) AS DECIMAL(38,0)) WHEN 32 THEN CAST(ROUND(synalog_t, -17) AS DECIMAL(38,0)) WHEN 33 THEN CAST(ROUND(synalog_t, -18) AS DECIMAL(38,0)) WHEN 34 THEN CAST(ROUND(synalog_t, -19) AS DECIMAL(38,0)) WHEN 35 THEN CAST(ROUND(synalog_t, -20) AS DECIMAL(38,0)) WHEN 36 THEN CAST(ROUND(synalog_t, -21) AS DECIMAL(38,0)) WHEN 37 THEN CAST(ROUND(synalog_t, -22) AS DECIMAL(38,0)) WHEN 38 THEN CAST(ROUND(synalog_t, -23) AS DECIMAL(38,0)) END AS VARCHAR), [CAST(synalog_v AS DECIMAL(38,0))]), 1) END), [Employees.person_id]), 1))) AS party_id,
      Employees.name AS name,
      'employee' AS kind
    FROM
      t_1_Employees AS Employees
   UNION ALL
  
    SELECT
      (concat('contractor:', arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS DECIMAL(38,0)) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) < 1 THEN arrayElement(arrayMap(synalog_s -> if(position(synalog_s, '.') > 0, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)), synalog_s), [CAST(CAST(ROUND(CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,35)), 15) AS DECIMAL(38,35)) AS VARCHAR)]), 1) WHEN ABS(synalog_v) < 1e18 THEN arrayElement(arrayMap(synalog_t -> arrayElement(arrayMap(synalog_s -> if(position(synalog_s, '.') > 0, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM synalog_s)), synalog_s), [CAST(CASE LENGTH(CAST(CAST(FLOOR(ABS(synalog_t)) AS BIGINT) AS VARCHAR)) WHEN 1 THEN CAST(ROUND(synalog_t, 14) AS DECIMAL(38,20)) WHEN 2 THEN CAST(ROUND(synalog_t, 13) AS DECIMAL(38,20)) WHEN 3 THEN CAST(ROUND(synalog_t, 12) AS DECIMAL(38,20)) WHEN 4 THEN CAST(ROUND(synalog_t, 11) AS DECIMAL(38,20)) WHEN 5 THEN CAST(ROUND(synalog_t, 10) AS DECIMAL(38,20)) WHEN 6 THEN CAST(ROUND(synalog_t, 9) AS DECIMAL(38,20)) WHEN 7 THEN CAST(ROUND(synalog_t, 8) AS DECIMAL(38,20)) WHEN 8 THEN CAST(ROUND(synalog_t, 7) AS DECIMAL(38,20)) WHEN 9 THEN CAST(ROUND(synalog_t, 6) AS DECIMAL(38,20)) WHEN 10 THEN CAST(ROUND(synalog_t, 5) AS DECIMAL(38,20)) WHEN 11 THEN CAST(ROUND(synalog_t, 4) AS DECIMAL(38,20)) WHEN 12 THEN CAST(ROUND(synalog_t, 3) AS DECIMAL(38,20)) WHEN 13 THEN CAST(ROUND(synalog_t, 2) AS DECIMAL(38,20)) WHEN 14 THEN CAST(ROUND(synalog_t, 1) AS DECIMAL(38,20)) WHEN 15 THEN CAST(ROUND(synalog_t, 0) AS DECIMAL(38,20)) WHEN 16 THEN CAST(ROUND(synalog_t, -1) AS DECIMAL(38,20)) WHEN 17 THEN CAST(ROUND(synalog_t, -2) AS DECIMAL(38,20)) WHEN 18 THEN CAST(ROUND(synalog_t, -3) AS DECIMAL(38,20)) END AS VARCHAR)]), 1), [CAST(CAST(synalog_v AS VARCHAR) AS DECIMAL(38,20))]), 1) ELSE arrayElement(arrayMap(synalog_t -> CAST(CASE LENGTH(CAST(ABS(synalog_t) AS VARCHAR)) WHEN 19 THEN CAST(ROUND(synalog_t, -4) AS DECIMAL(38,0)) WHEN 20 THEN CAST(ROUND(synalog_t, -5) AS DECIMAL(38,0)) WHEN 21 THEN CAST(ROUND(synalog_t, -6) AS DECIMAL(38,0)) WHEN 22 THEN CAST(ROUND(synalog_t, -7) AS DECIMAL(38,0)) WHEN 23 THEN CAST(ROUND(synalog_t, -8) AS DECIMAL(38,0)) WHEN 24 THEN CAST(ROUND(synalog_t, -9) AS DECIMAL(38,0)) WHEN 25 THEN CAST(ROUND(synalog_t, -10) AS DECIMAL(38,0)) WHEN 26 THEN CAST(ROUND(synalog_t, -11) AS DECIMAL(38,0)) WHEN 27 THEN CAST(ROUND(synalog_t, -12) AS DECIMAL(38,0)) WHEN 28 THEN CAST(ROUND(synalog_t, -13) AS DECIMAL(38,0)) WHEN 29 THEN CAST(ROUND(synalog_t, -14) AS DECIMAL(38,0)) WHEN 30 THEN CAST(ROUND(synalog_t, -15) AS DECIMAL(38,0)) WHEN 31 THEN CAST(ROUND(synalog_t, -16) AS DECIMAL(38,0)) WHEN 32 THEN CAST(ROUND(synalog_t, -17) AS DECIMAL(38,0)) WHEN 33 THEN CAST(ROUND(synalog_t, -18) AS DECIMAL(38,0)) WHEN 34 THEN CAST(ROUND(synalog_t, -19) AS DECIMAL(38,0)) WHEN 35 THEN CAST(ROUND(synalog_t, -20) AS DECIMAL(38,0)) WHEN 36 THEN CAST(ROUND(synalog_t, -21) AS DECIMAL(38,0)) WHEN 37 THEN CAST(ROUND(synalog_t, -22) AS DECIMAL(38,0)) WHEN 38 THEN CAST(ROUND(synalog_t, -23) AS DECIMAL(38,0)) END AS VARCHAR), [CAST(synalog_v AS DECIMAL(38,0))]), 1) END), [Contractors.contractor_id]), 1))) AS party_id,
      Contractors.name AS name,
      'contractor' AS kind
    FROM
      t_2_Contractors AS Contractors
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Party_MultBodyAggAux.party_id AS party_id,
  Party_MultBodyAggAux.name AS name,
  Party_MultBodyAggAux.kind AS kind
FROM
  t_0_Party_MultBodyAggAux AS Party_MultBodyAggAux
GROUP BY 1, 2, 3 ORDER BY party_id;
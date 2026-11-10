-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS region,
      'tea' AS product,
      120 AS amount
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS region,
      'cake' AS product,
      40 AS amount
   UNION ALL
  
    SELECT
      3 AS id,
      'south' AS region,
      'tea' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS region,
      'coffee' AS product,
      210 AS amount
   UNION ALL
  
    SELECT
      5 AS id,
      'east' AS region,
      'cake' AS product,
      55 AS amount
   UNION ALL
  
    SELECT
      6 AS id,
      'east' AS region,
      'tea' AS product,
      130 AS amount
   UNION ALL
  
    SELECT
      7 AS id,
      'north' AS region,
      'coffee' AS product,
      95 AS amount
   UNION ALL
  
    SELECT
      8 AS id,
      'south' AS region,
      'cake' AS product,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_1_R AS (SELECT
  JSON_ARRAYAGG(Sale.amount) AS l
FROM
  t_2_Sale AS Sale
WHERE
  (Sale.region = 'south')),
t_3_T AS (SELECT
  SUM(JSON_VALUE(x_10.value, '$' RETURNING DOUBLE)) AS t
FROM
  t_1_R AS t_4_R, LATERAL (SELECT synalog_u.value FROM (SELECT t_4_R.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_10)
SELECT
  JSON_LENGTH(R.l) AS n,
  t_0_T.t AS t
FROM
  t_1_R AS R, t_3_T AS t_0_T;
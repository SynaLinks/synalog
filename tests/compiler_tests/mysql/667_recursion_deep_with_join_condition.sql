-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_3_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_23.value, '$' RETURNING DOUBLE)) + (2)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_23
      WHERE
        (((JSON_VALUE(x_23.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (JSON_VALUE(x_23.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_39.value, '$' RETURNING DOUBLE)) + (2)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_39, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_45
      WHERE
        (((JSON_VALUE(x_39.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((JSON_VALUE(x_45.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (JSON_VALUE(x_39.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_45.value, '$' RETURNING DOUBLE)) + (2))) AND
        (JSON_VALUE(x_45.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_61.value, '$' RETURNING DOUBLE)) + (2)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_61, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_68, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_74
      WHERE
        (((JSON_VALUE(x_61.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((JSON_VALUE(x_68.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (((0) + (1)) < 30) AND
        (((JSON_VALUE(x_74.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
        (0 < 30) AND
        (1 = 0) AND
        (JSON_VALUE(x_61.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_68.value, '$' RETURNING DOUBLE)) + (2))) AND
        (JSON_VALUE(x_68.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_74.value, '$' RETURNING DOUBLE)) + (2))) AND
        (JSON_VALUE(x_74.value, '$' RETURNING DOUBLE) = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((JSON_VALUE(x_81.value, '$' RETURNING DOUBLE)) + (2)) AS y,
  ((t_17_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_R_RecursiveCte AS t_17_R_RecursiveCte, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_81
WHERE
  (((JSON_VALUE(x_81.value, '$' RETURNING DOUBLE)) + (2)) < 25) AND
  (t_17_R_RecursiveCte.synalog_step < 30) AND
  (t_17_R_RecursiveCte.y = JSON_VALUE(x_81.value, '$' RETURNING DOUBLE))),
t_2_R AS (SELECT
  R_RecursiveCte.y AS y
FROM
  t_3_R_RecursiveCte AS R_RecursiveCte
GROUP BY 1),
t_1_M AS (SELECT
  MAX(R.y) AS m
FROM
  t_2_R AS R)
SELECT * FROM (
SELECT
  t_0_M.m AS m
FROM
  t_1_M AS t_0_M
) AS UNUSED_TABLE_NAME ORDER BY m IS NULL, m;
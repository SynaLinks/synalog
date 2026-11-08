-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_3_A_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_22.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_22
      WHERE
        (0 < 21) AND
        (1 = 0) AND
        (JSON_VALUE(x_22.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_38.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_38, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_44
      WHERE
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (JSON_VALUE(x_38.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_44.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_44.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_60.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_60, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_67, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_73
      WHERE
        (((((0) + (1))) + (1)) < 21) AND
        (((0) + (1)) < 21) AND
        (0 < 21) AND
        (1 = 0) AND
        (JSON_VALUE(x_60.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_67.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_67.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_73.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_73.value, '$' RETURNING DOUBLE) = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((JSON_VALUE(x_80.value, '$' RETURNING DOUBLE)) + (1)) AS y,
  ((t_17_A_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_A_RecursiveCte AS t_17_A_RecursiveCte, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_80
WHERE
  (t_17_A_RecursiveCte.synalog_step < 21) AND
  (t_17_A_RecursiveCte.y = JSON_VALUE(x_80.value, '$' RETURNING DOUBLE))),
t_2_A AS (SELECT
  A_RecursiveCte.y AS y
FROM
  t_3_A_RecursiveCte AS A_RecursiveCte
GROUP BY 1),
t_20_B_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_101.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_101
      WHERE
        (0 < 22) AND
        (1 = 0) AND
        (JSON_VALUE(x_101.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_117.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_117, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_123
      WHERE
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (JSON_VALUE(x_117.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_123.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_123.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_139.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_139, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_146, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_152
      WHERE
        (((((0) + (1))) + (1)) < 22) AND
        (((0) + (1)) < 22) AND
        (0 < 22) AND
        (1 = 0) AND
        (JSON_VALUE(x_139.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_146.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_146.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_152.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_152.value, '$' RETURNING DOUBLE) = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((JSON_VALUE(x_159.value, '$' RETURNING DOUBLE)) + (1)) AS y,
  ((t_35_B_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_20_B_RecursiveCte AS t_35_B_RecursiveCte, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_159
WHERE
  (t_35_B_RecursiveCte.synalog_step < 22) AND
  (t_35_B_RecursiveCte.y = JSON_VALUE(x_159.value, '$' RETURNING DOUBLE))),
t_19_B AS (SELECT
  B_RecursiveCte.y AS y
FROM
  t_20_B_RecursiveCte AS B_RecursiveCte
GROUP BY 1)
SELECT
  MAX(t_0_A.y) AS a,
  MAX(t_1_B.y) AS b
FROM
  t_2_A AS t_0_A, t_19_B AS t_1_B;
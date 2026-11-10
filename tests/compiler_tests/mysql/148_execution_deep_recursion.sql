-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH RECURSIVE t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_21.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((0) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_21
      WHERE
        (0 < 40) AND
        (1 = 0) AND
        (JSON_VALUE(x_21.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_37.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_37, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_43
      WHERE
        (((0) + (1)) < 40) AND
        (0 < 40) AND
        (1 = 0) AND
        (JSON_VALUE(x_37.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_43.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_43.value, '$' RETURNING DOUBLE) = 0)
     UNION ALL
    
      SELECT
        ((JSON_VALUE(x_59.value, '$' RETURNING DOUBLE)) + (1)) AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_59, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_66, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_72
      WHERE
        (((((0) + (1))) + (1)) < 40) AND
        (((0) + (1)) < 40) AND
        (0 < 40) AND
        (1 = 0) AND
        (JSON_VALUE(x_59.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_66.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_66.value, '$' RETURNING DOUBLE) = ((JSON_VALUE(x_72.value, '$' RETURNING DOUBLE)) + (1))) AND
        (JSON_VALUE(x_72.value, '$' RETURNING DOUBLE) = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((JSON_VALUE(x_79.value, '$' RETURNING DOUBLE)) + (1)) AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(100, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 100) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_79
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 40) AND
  (t_15_Reach_RecursiveCte.y = JSON_VALUE(x_79.value, '$' RETURNING DOUBLE))),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY 1)
SELECT
  MAX(Reach.y) AS m
FROM
  t_0_Reach AS Reach;
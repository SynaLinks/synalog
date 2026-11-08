-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_P1 AS (SELECT * FROM (
SELECT
  (MOD(((JSON_VALUE(x_2.value, '$' RETURNING DOUBLE)) * (17)), NULLIF(39, 0))) AS col0
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_2
) AS UNUSED_TABLE_NAME ORDER BY col0 IS NULL, col0),
t_0_P2 AS (SELECT
  JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) AS col0
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(20, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 20) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5 LIMIT 5),
t_0_P3 AS (SELECT * FROM (
SELECT
  JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) AS col0
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(20, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 20) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5
WHERE
  ((MOD(JSON_VALUE(x_5.value, '$' RETURNING DOUBLE), NULLIF(2, 0))) = 0)
) AS UNUSED_TABLE_NAME ORDER BY col0 IS NULL, col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'ordered' AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      'limited' AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      'both' AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0 IS NULL, col0, col1 IS NULL, col1 ;
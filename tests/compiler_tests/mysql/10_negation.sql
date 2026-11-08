-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Prime AS (SELECT * FROM (
  
    SELECT
      2 AS col0
   UNION ALL
  
    SELECT
      3 AS col0
   UNION ALL
  
    SELECT
      5 AS col0
   UNION ALL
  
    SELECT
      7 AS col0
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      'odd' AS test_name,
      JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5
    WHERE
      ((SELECT
        MIN(1) AS synalog_value
      FROM
        LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_10
      WHERE
        ((MOD(JSON_VALUE(x_5.value, '$' RETURNING DOUBLE), NULLIF(2, 0))) = 0) AND
        (JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) = JSON_VALUE(x_10.value, '$' RETURNING DOUBLE))) IS NULL)
   UNION ALL
  
    SELECT
      'not_prime' AS test_name,
      JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_5
    WHERE
      (JSON_VALUE(x_5.value, '$' RETURNING DOUBLE) > 1) AND
      ((SELECT
        MIN(1) AS synalog_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = JSON_VALUE(x_5.value, '$' RETURNING DOUBLE))) IS NULL)
   UNION ALL
  
    SELECT
      'even_not_prime' AS test_name,
      JSON_VALUE(x_7.value, '$' RETURNING DOUBLE) AS x
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_7
    WHERE
      ((SELECT
        MIN(1) AS synalog_value
      FROM
        t_0_Prime AS Prime
      WHERE
        (Prime.col0 = JSON_VALUE(x_7.value, '$' RETURNING DOUBLE))) IS NULL) AND
      ((MOD(JSON_VALUE(x_7.value, '$' RETURNING DOUBLE), NULLIF(2, 0))) = 0)
  
) AS UNUSED_TABLE_NAME  ORDER BY test_name IS NULL, test_name, x IS NULL, x ;
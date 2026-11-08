-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      JSON_VALUE(x_15.value, '$' RETURNING DOUBLE) AS x,
      ((JSON_VALUE(x_15.value, '$' RETURNING DOUBLE)) * (JSON_VALUE(x_15.value, '$' RETURNING DOUBLE))) AS sq,
      'even' AS type
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_15
    WHERE
      ((MOD(JSON_VALUE(x_15.value, '$' RETURNING DOUBLE), NULLIF(2, 0))) = 0)
   UNION ALL
  
    SELECT
      JSON_VALUE(x_25.value, '$' RETURNING DOUBLE) AS x,
      ((JSON_VALUE(x_25.value, '$' RETURNING DOUBLE)) * (JSON_VALUE(x_25.value, '$' RETURNING DOUBLE))) AS sq,
      'odd' AS type
    FROM
      LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(10, 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= 10) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_25
    WHERE
      ((MOD(JSON_VALUE(x_25.value, '$' RETURNING DOUBLE), NULLIF(2, 0))) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;
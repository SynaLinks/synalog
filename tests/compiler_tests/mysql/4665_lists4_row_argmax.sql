-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2, 3) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(7) AS l
   UNION ALL
  
    SELECT
      4 AS k,
      JSON_ARRAY(5, 5, 9, 1) AS l
   UNION ALL
  
    SELECT
      5 AS k,
      CAST(NULL AS JSON) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  t_0_L.k AS k,
  (SELECT
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_VALUE(x_6.value, '$' RETURNING DOUBLE)), '$[0]') ORDER BY JSON_VALUE((CASE WHEN JSON_VALUE(x_6.value, '$' RETURNING DOUBLE) < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, CONCAT('$[', JSON_VALUE(x_6.value, '$' RETURNING DOUBLE), ']')) END), '$' RETURNING DOUBLE) DESC SEPARATOR ','), ']') AS JSON), '$[0]') AS synalog_value
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(JSON_LENGTH(t_0_L.l), 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= JSON_LENGTH(t_0_L.l)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_6) AS v
FROM
  t_2_L AS t_0_L
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;
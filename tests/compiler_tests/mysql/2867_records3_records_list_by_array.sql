-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_OBJECT('n', V.n)), '$[0]') ORDER BY V.k IS NULL ASC, V.k ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_EXTRACT((CASE WHEN JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) < 0 THEN NULL ELSE JSON_EXTRACT(t_4_L.l, CONCAT('$[', JSON_VALUE(x_12.value, '$' RETURNING DOUBLE), ']')) END), '$."n"')), '$[0]') ORDER BY JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) IS NULL ASC, JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) ASC SEPARATOR ','), ']') AS JSON) AS s
FROM
  t_5_L AS t_4_L, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(JSON_LENGTH(t_4_L.l), 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= JSON_LENGTH(t_4_L.l)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_12)
SELECT
  (CASE WHEN J.s IS NULL OR '-' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(synalog_j.v ORDER BY synalog_j.i SEPARATOR '-') FROM (SELECT J.s AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (i FOR ORDINALITY, v TEXT COLLATE utf8mb4_0900_bin PATH '$')) AS synalog_j), '') END) AS s
FROM
  t_0_J AS J;
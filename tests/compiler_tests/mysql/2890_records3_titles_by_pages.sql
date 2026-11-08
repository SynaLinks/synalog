-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_8_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Dune' AS title,
      'herbert' AS author,
      1965 AS year,
      412 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      2 AS id,
      'Emma' AS title,
      'austen' AS author,
      1815 AS year,
      474 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      3 AS id,
      'Ubik' AS title,
      'dick' AS author,
      1969 AS year,
      202 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      4 AS id,
      'Kim' AS title,
      'kipling' AS author,
      1901 AS year,
      368 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      5 AS id,
      'Solaris' AS title,
      'lem' AS author,
      1961 AS year,
      204 AS pages,
      true AS sf
   UNION ALL
  
    SELECT
      6 AS id,
      'Persuasion' AS title,
      'austen' AS author,
      1817 AS year,
      249 AS pages,
      false AS sf
   UNION ALL
  
    SELECT
      7 AS id,
      'Valis' AS title,
      'dick' AS author,
      1981 AS year,
      271 AS pages,
      true AS sf
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_OBJECT('t', B.title)), '$[0]') ORDER BY B.pages IS NULL ASC, B.pages ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_8_B AS B),
t_0_J AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_EXTRACT((CASE WHEN JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) < 0 THEN NULL ELSE JSON_EXTRACT(t_4_L.l, CONCAT('$[', JSON_VALUE(x_12.value, '$' RETURNING DOUBLE), ']')) END), '$."t"')), '$[0]') ORDER BY JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) IS NULL ASC, JSON_VALUE(x_12.value, '$' RETURNING DOUBLE) ASC SEPARATOR ','), ']') AS JSON) AS s
FROM
  t_5_L AS t_4_L, LATERAL (SELECT synalog_u.value FROM (SELECT (SELECT COALESCE(CAST(CONCAT('[', GROUP_CONCAT(synalog_r.n - 1 ORDER BY synalog_r.n SEPARATOR ','), ']') AS JSON), JSON_ARRAY()) FROM JSON_TABLE(CONCAT('[', REPEAT('0,', GREATEST(JSON_LENGTH(t_4_L.l), 0)), '0]'), '$[*]' COLUMNS (n FOR ORDINALITY)) AS synalog_r WHERE synalog_r.n <= JSON_LENGTH(t_4_L.l)) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_12)
SELECT
  (CASE WHEN J.s IS NULL OR ', ' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(synalog_j.v ORDER BY synalog_j.i SEPARATOR ', ') FROM (SELECT J.s AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (i FOR ORDINALITY, v TEXT COLLATE utf8mb4_0900_bin PATH '$')) AS synalog_j), '') END) AS s
FROM
  t_0_J AS J;
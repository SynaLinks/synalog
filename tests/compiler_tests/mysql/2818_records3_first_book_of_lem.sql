-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_4_B AS (SELECT * FROM (
  
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
t_1_L AS (SELECT
  CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_OBJECT('title', B.title, 'year', B.year)), '$[0]') ORDER BY B.year IS NULL ASC, B.year ASC SEPARATOR ','), ']') AS JSON) AS l
FROM
  t_4_B AS B
WHERE
  (B.author = 'lem'))
SELECT
  JSON_EXTRACT((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, CONCAT('$[', 0, ']')) END), '$."title"') AS title,
  JSON_EXTRACT((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(t_0_L.l, CONCAT('$[', 0, ']')) END), '$."year"') AS year
FROM
  t_1_L AS t_0_L;
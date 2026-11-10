-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Tags AS (SELECT * FROM (
  
    SELECT
      'post1' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post1' AS col0,
      'featured' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tech' AS col1
   UNION ALL
  
    SELECT
      'post2' AS col0,
      'tutorial' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
   UNION ALL
  
    SELECT
      'post3' AS col0,
      'news' AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_TagCount AS (SELECT
  Tags.col0 AS col0,
  SUM(1) AS count
FROM
  t_1_Tags AS Tags
GROUP BY 1)
SELECT * FROM (
SELECT
  TagCount.col0 AS post,
  TagCount.count AS count
FROM
  t_0_TagCount AS TagCount
) AS UNUSED_TABLE_NAME ORDER BY post IS NULL, post;
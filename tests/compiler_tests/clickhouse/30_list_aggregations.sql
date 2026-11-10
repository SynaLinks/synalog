-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

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
SELECT
  TagCount.col0 AS post,
  TagCount.count AS count
FROM
  t_0_TagCount AS TagCount ORDER BY post;
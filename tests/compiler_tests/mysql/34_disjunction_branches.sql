-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Products AS (SELECT * FROM (
  
    SELECT
      'laptop' AS col0,
      1000 AS col1,
      'electronics' AS col2
   UNION ALL
  
    SELECT
      'phone' AS col0,
      500 AS col1,
      'electronics' AS col2
   UNION ALL
  
    SELECT
      'book' AS col0,
      20 AS col1,
      'media' AS col2
   UNION ALL
  
    SELECT
      'headphones' AS col0,
      150 AS col1,
      'electronics' AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_SpecialProducts AS (SELECT * FROM (
  
    SELECT
      Products.col0 AS col0,
      'expensive' AS col1
    FROM
      t_1_Products AS Products
    WHERE
      (Products.col1 > 800)
   UNION ALL
  
    SELECT
      t_2_Products.col0 AS col0,
      'media_item' AS col1
    FROM
      t_1_Products AS t_2_Products
    WHERE
      (t_2_Products.col2 = 'media')
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  SpecialProducts.col0 AS name,
  SpecialProducts.col1 AS reason
FROM
  t_0_SpecialProducts AS SpecialProducts
GROUP BY 1, 2
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;
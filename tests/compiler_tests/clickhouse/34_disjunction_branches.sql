-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

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
SELECT
  SpecialProducts.col0 AS name,
  SpecialProducts.col1 AS reason
FROM
  t_0_SpecialProducts AS SpecialProducts
GROUP BY 1, 2 ORDER BY name;
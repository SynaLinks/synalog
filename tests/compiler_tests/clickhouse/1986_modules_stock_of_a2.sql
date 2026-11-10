-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Shop_Stock AS (SELECT * FROM (
  
    SELECT
      'a1' AS sku,
      100 AS qty
   UNION ALL
  
    SELECT
      'a2' AS sku,
      40 AS qty
   UNION ALL
  
    SELECT
      'b1' AS sku,
      3 AS qty
   UNION ALL
  
    SELECT
      'c1' AS sku,
      0 AS qty
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Shop_Stock.qty AS qty
FROM
  t_0_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = 'a2');
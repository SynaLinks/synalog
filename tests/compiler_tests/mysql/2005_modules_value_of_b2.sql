-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Shop_Product AS (SELECT * FROM (
  
    SELECT
      'a1' AS sku,
      'pen' AS name,
      2 AS price
   UNION ALL
  
    SELECT
      'a2' AS sku,
      'pad' AS name,
      5 AS price
   UNION ALL
  
    SELECT
      'b1' AS sku,
      'lamp' AS name,
      30 AS price
   UNION ALL
  
    SELECT
      'b2' AS sku,
      'desk' AS name,
      120 AS price
   UNION ALL
  
    SELECT
      'c1' AS sku,
      'mug' AS name,
      8 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_1_Shop_Stock AS (SELECT * FROM (
  
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
  ((Shop_Product.price) * (Shop_Stock.qty)) AS value
FROM
  t_0_Shop_Product AS Shop_Product, t_1_Shop_Stock AS Shop_Stock
WHERE
  (Shop_Stock.sku = Shop_Product.sku) AND
  ('b2' = Shop_Product.sku);
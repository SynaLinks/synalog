-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_Mine AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_A AS (SELECT
  SUM(Mine.x) AS t
FROM
  t_3_Mine AS Mine),
t_5_Shop_Product AS (SELECT * FROM (
  
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
t_4_B AS (SELECT
  SUM(Shop_Product.price) AS t
FROM
  t_5_Shop_Product AS Shop_Product)
SELECT
  t_0_A.t AS a,
  t_1_B.t AS b
FROM
  t_2_A AS t_0_A, t_4_B AS t_1_B;
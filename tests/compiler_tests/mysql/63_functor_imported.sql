-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_2_Segments_Customer AS (SELECT * FROM (
  
    SELECT
      1 AS customer_id,
      'enterprise' AS tier
   UNION ALL
  
    SELECT
      2 AS customer_id,
      'smb' AS tier
  
) AS UNUSED_TABLE_NAME  ),
t_1_Enterprise AS (SELECT
  Segments_Customer.customer_id AS customer_id
FROM
  t_2_Segments_Customer AS Segments_Customer
WHERE
  (Segments_Customer.tier = 'enterprise')
GROUP BY 1),
t_3_Segments_Order AS (SELECT * FROM (
  
    SELECT
      1 AS customer_id,
      100 AS amount
   UNION ALL
  
    SELECT
      2 AS customer_id,
      7 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_EnterpriseRevenue AS (SELECT
  SUM(Segments_Order.amount) AS revenue
FROM
  t_1_Enterprise AS Enterprise, t_3_Segments_Order AS Segments_Order
WHERE
  (Segments_Order.customer_id = Enterprise.customer_id))
SELECT * FROM (
SELECT
  EnterpriseRevenue.revenue AS revenue
FROM
  t_0_EnterpriseRevenue AS EnterpriseRevenue
) AS UNUSED_TABLE_NAME ORDER BY revenue IS NULL, revenue;
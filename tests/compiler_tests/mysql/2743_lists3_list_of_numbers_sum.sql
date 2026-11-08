-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_I AS (SELECT * FROM (
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'pen' AS item,
      2.5e0 AS price,
      3 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      1 AS "order",
      'ann' AS customer,
      'ink' AS item,
      7.0e0 AS price,
      1 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      2 AS "order",
      'ann' AS customer,
      'pad' AS item,
      4.0e0 AS price,
      2 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'pen' AS item,
      2.5e0 AS price,
      10 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'cap' AS item,
      1.25e0 AS price,
      4 AS qty,
      2 AS pos
   UNION ALL
  
    SELECT
      3 AS "order",
      'bob' AS customer,
      'ink' AS item,
      7.0e0 AS price,
      2 AS qty,
      3 AS pos
   UNION ALL
  
    SELECT
      4 AS "order",
      'cid' AS customer,
      'pad' AS item,
      4.0e0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5e0 AS price,
      1 AS qty,
      1 AS pos
   UNION ALL
  
    SELECT
      5 AS "order",
      'cid' AS customer,
      'pen' AS item,
      2.5e0 AS price,
      2 AS qty,
      2 AS pos
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q0 AS (SELECT
  I.customer AS customer,
  JSON_ARRAYAGG(I.qty) AS l
FROM
  t_1_I AS I
GROUP BY 1)
SELECT * FROM (
SELECT
  Q0.customer AS customer,
  SUM(JSON_VALUE(x_3.value, '$' RETURNING DOUBLE)) AS t
FROM
  t_0_Q0 AS Q0, LATERAL (SELECT synalog_u.value FROM (SELECT Q0.l AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_3
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY customer IS NULL, customer, t IS NULL, t;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Line AS (SELECT * FROM (
  
    SELECT
      10 AS "order",
      'a' AS "group",
      1 AS "select"
   UNION ALL
  
    SELECT
      11 AS "order",
      'b' AS "group",
      2 AS "select"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Line."order" AS "order",
  Line."group" AS "group",
  SUM(Line."select") AS total
FROM
  t_0_Line AS Line
GROUP BY 1, 2 ORDER BY "order" DESC;
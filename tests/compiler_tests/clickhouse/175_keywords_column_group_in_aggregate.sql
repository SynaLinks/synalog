-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS "group",
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS "group",
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS "group",
      4 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R."group" AS "group",
  SUM(R.v) AS total
FROM
  t_0_R AS R
GROUP BY 1 ORDER BY "group";
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2024-01-01' AS d
   UNION ALL
  
    SELECT
      2 AS id,
      '2024-02-28' AS d
   UNION ALL
  
    SELECT
      3 AS id,
      '2024-02-29' AS d
   UNION ALL
  
    SELECT
      4 AS id,
      '2023-03-01' AS d
   UNION ALL
  
    SELECT
      5 AS id,
      '2000-12-31' AS d
   UNION ALL
  
    SELECT
      6 AS id,
      '1999-07-15' AS d
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-10-06' AS d
   UNION ALL
  
    SELECT
      8 AS id,
      '1970-01-01' AS d
   UNION ALL
  
    SELECT
      9 AS id,
      '2100-02-28' AS d
   UNION ALL
  
    SELECT
      10 AS id,
      '2004-08-09' AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS x
FROM
  t_1_V AS V, t_1_V AS t_0_V
WHERE
  (V.d < t_0_V.d) AND
  (V.id = 8) AND
  (t_0_V.id = 7);
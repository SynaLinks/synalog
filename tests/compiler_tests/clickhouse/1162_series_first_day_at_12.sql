-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Reading AS (SELECT * FROM (
  
    SELECT
      1 AS day,
      10 AS value
   UNION ALL
  
    SELECT
      2 AS day,
      12 AS value
   UNION ALL
  
    SELECT
      3 AS day,
      11 AS value
   UNION ALL
  
    SELECT
      4 AS day,
      15 AS value
   UNION ALL
  
    SELECT
      5 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      6 AS day,
      18 AS value
   UNION ALL
  
    SELECT
      7 AS day,
      14 AS value
   UNION ALL
  
    SELECT
      8 AS day,
      20 AS value
   UNION ALL
  
    SELECT
      9 AS day,
      25 AS value
   UNION ALL
  
    SELECT
      10 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      11 AS day,
      22 AS value
   UNION ALL
  
    SELECT
      12 AS day,
      30 AS value
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MIN(Reading.day) AS d
FROM
  t_0_Reading AS Reading
WHERE
  (Reading.value >= 12);
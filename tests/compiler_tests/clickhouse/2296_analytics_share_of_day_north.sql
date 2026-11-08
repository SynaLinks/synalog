-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_S.v) AS t
FROM
  t_1_S AS t_3_S
WHERE
  (t_3_S.r = 'north'))
SELECT
  S.d AS d,
  arrayElement(arrayMap(synalog_v -> (CASE WHEN synalog_v IS NULL OR 6 IS NULL THEN NULL WHEN CAST(synalog_v AS Float64) = 0 THEN CAST(synalog_v AS Float64) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 6 >= 0 THEN (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS Float64) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS Float64)) * POWER(10, 6) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS Float64)))) - 14 + 6)) / POWER(10, 6) + 0 END), [((100) * ((S.v / NULLIF(t_0_T.t, 0))))]), 1) AS pct
FROM
  t_1_S AS S, t_2_T AS t_0_T
WHERE
  (S.r = 'north') ORDER BY d, pct;
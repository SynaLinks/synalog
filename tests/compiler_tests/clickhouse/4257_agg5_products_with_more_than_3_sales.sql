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
      1 AS id,
      'north' AS r,
      'ax' AS p,
      3 AS q,
      10.0 AS pr
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS r,
      'ax' AS p,
      null AS q,
      10.0 AS pr
   UNION ALL
  
    SELECT
      3 AS id,
      'north' AS r,
      'bo' AS p,
      5 AS q,
      4.0 AS pr
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS r,
      'ax' AS p,
      1 AS q,
      12.0 AS pr
   UNION ALL
  
    SELECT
      5 AS id,
      'south' AS r,
      'cy' AS p,
      7 AS q,
      null AS pr
   UNION ALL
  
    SELECT
      6 AS id,
      'south' AS r,
      'cy' AS p,
      2 AS q,
      3.0 AS pr
   UNION ALL
  
    SELECT
      7 AS id,
      'east' AS r,
      'bo' AS p,
      null AS q,
      null AS pr
   UNION ALL
  
    SELECT
      8 AS id,
      null AS r,
      'ax' AS p,
      4 AS q,
      9.0 AS pr
   UNION ALL
  
    SELECT
      9 AS id,
      null AS r,
      'dz' AS p,
      6 AS q,
      1.0 AS pr
   UNION ALL
  
    SELECT
      10 AS id,
      'east' AS r,
      'dz' AS p,
      8 AS q,
      2.0 AS pr
   UNION ALL
  
    SELECT
      11 AS id,
      'north' AS r,
      'cy' AS p,
      3 AS q,
      6.0 AS pr
   UNION ALL
  
    SELECT
      12 AS id,
      'west' AS r,
      'ax' AS p,
      9 AS q,
      10.0 AS pr
  
) AS UNUSED_TABLE_NAME  ),
t_0_C AS (SELECT
  S.p AS p,
  SUM(1) AS n
FROM
  t_1_S AS S
GROUP BY 1)
SELECT
  C.p AS p
FROM
  t_0_C AS C
WHERE
  (C.n > 3) ORDER BY p;
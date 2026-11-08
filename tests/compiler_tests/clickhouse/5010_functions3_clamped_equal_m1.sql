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
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k
FROM
  t_1_V AS V
WHERE
  ((CASE WHEN 0 IS NULL OR (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END)) END) = (CASE WHEN 0 IS NULL OR (CASE WHEN -1 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(-1, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN -1 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(-1, 5) END)) END)) ORDER BY k;
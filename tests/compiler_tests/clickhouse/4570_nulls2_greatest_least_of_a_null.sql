-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Gv AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      null AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Gv.a AS a,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE GREATEST(Gv.a, Gv.b) END) AS g,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE LEAST(Gv.a, Gv.b) END) AS l,
  (CASE WHEN Gv.a IS NULL OR 2.5 IS NULL OR COALESCE(Gv.b, 0) IS NULL THEN NULL ELSE GREATEST(Gv.a, 2.5, COALESCE(Gv.b, 0)) END) AS h
FROM
  t_0_Gv AS Gv ORDER BY a;
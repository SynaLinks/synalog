-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Names AS (SELECT * FROM (
  
    SELECT
      'alice' AS name
   UNION ALL
  
    SELECT
      'alan' AS name
   UNION ALL
  
    SELECT
      'bob' AS name
   UNION ALL
  
    SELECT
      'albert' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_0_StartsWithAl AS (SELECT
  Names.name AS name
FROM
  t_1_Names AS Names
WHERE
  (Names.name LIKE 'al%') ORDER BY name)
SELECT
  StartsWithAl.name AS name
FROM
  t_0_StartsWithAl AS StartsWithAl ORDER BY name;
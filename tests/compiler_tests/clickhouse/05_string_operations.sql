-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Names AS (SELECT * FROM (
  
    SELECT
      'Alice' AS first,
      'Smith' AS last
   UNION ALL
  
    SELECT
      'Bob' AS first,
      'Jones' AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (concat((concat(Names.first, ' ')), Names.last)) AS name
FROM
  t_0_Names AS Names ORDER BY name;
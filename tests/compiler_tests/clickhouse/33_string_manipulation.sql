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
      'alice' AS first,
      'smith' AS last
   UNION ALL
  
    SELECT
      'bob' AS first,
      'jones' AS last
   UNION ALL
  
    SELECT
      'charlie' AS first,
      'brown' AS last
  
) AS UNUSED_TABLE_NAME  ),
t_0_FormattedNames AS (SELECT
  Names.first AS first,
  upperUTF8(Names.first) AS upper_first,
  lengthUTF8(Names.last) AS len
FROM
  t_1_Names AS Names ORDER BY first)
SELECT
  FormattedNames.first AS first,
  FormattedNames.upper_first AS upper_first,
  FormattedNames.len AS len
FROM
  t_0_FormattedNames AS FormattedNames ORDER BY first;
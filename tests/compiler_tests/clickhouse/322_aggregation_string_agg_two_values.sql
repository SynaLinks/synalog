-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      'b' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_J AS (SELECT
  (CASE WHEN count(V.s) > 0 THEN arrayStringConcat(groupArray(toString(V.s)), ',') END) AS j
FROM
  t_2_V AS V)
SELECT
  length(splitByString(',', ifNull(t_0_J.j, ''))) AS parts,
  lengthUTF8(t_0_J.j) AS length
FROM
  t_1_J AS t_0_J;
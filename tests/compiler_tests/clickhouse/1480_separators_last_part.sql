-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      'ada' AS name,
      'ada@analytical.org' AS email
   UNION ALL
  
    SELECT
      'ken' AS name,
      'ken@bell-labs.com' AS email
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.name AS name,
  (CASE WHEN ((length(splitByString('.', ifNull(E.email, '')))) - (1)) < 0 OR ((length(splitByString('.', ifNull(E.email, '')))) - (1)) >= length(splitByString('.', ifNull(E.email, ''))) THEN NULL ELSE arrayElement(splitByString('.', ifNull(E.email, '')), toInt64(((length(splitByString('.', ifNull(E.email, '')))) - (1))) + 1) END) AS tld
FROM
  t_0_E AS E ORDER BY name;
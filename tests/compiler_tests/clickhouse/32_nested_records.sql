-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      CAST(tuple(CAST(tuple('alice@example.com', '123') AS Tuple(email Nullable(String), phone Nullable(String))), 'Alice') AS Tuple(contact Tuple(email Nullable(String), phone Nullable(String)), name Nullable(String))) AS info
   UNION ALL
  
    SELECT
      2 AS id,
      CAST(tuple(CAST(tuple('bob@example.com', '456') AS Tuple(email Nullable(String), phone Nullable(String))), 'Bob') AS Tuple(contact Tuple(email Nullable(String), phone Nullable(String)), name Nullable(String))) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id,
  tupleElement(Person.info, 'name') AS name,
  tupleElement(tupleElement(Person.info, 'contact'), 'email') AS email
FROM
  t_0_Person AS Person ORDER BY id;
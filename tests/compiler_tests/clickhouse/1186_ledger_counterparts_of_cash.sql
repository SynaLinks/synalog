-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Entry AS (SELECT * FROM (
  
    SELECT
      1 AS txn,
      'cash' AS account,
      -500 AS amount
   UNION ALL
  
    SELECT
      1 AS txn,
      'rent' AS account,
      500 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'cash' AS account,
      1200 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'sales' AS account,
      -1200 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'cash' AS account,
      -80 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'food' AS account,
      50 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'travel' AS account,
      30 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'bank' AS account,
      1000 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'cash' AS account,
      -1000 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'food' AS account,
      20 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'cash' AS account,
      -15 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Entry.account AS account
FROM
  t_1_Entry AS Entry, t_1_Entry AS t_0_Entry
WHERE
  (t_0_Entry.account != 'cash') AND
  (Entry.account = 'cash') AND
  (t_0_Entry.txn = Entry.txn)
GROUP BY 1 ORDER BY account;
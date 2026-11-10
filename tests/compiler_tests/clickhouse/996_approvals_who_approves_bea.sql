-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_1_Effective_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS ApproverOf
    WHERE
      NOT (ApproverOf.approver IS NOT NULL AND CAST(ApproverOf.approver AS Nullable(String)) IN (SELECT CAST(synalog_k0 AS Nullable(String)) FROM (SELECT
        'dan' AS synalog_k0
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      GROUP BY 1) AS synalog_m))
   UNION ALL
  
    SELECT
      'fay' AS approver,
      t_3_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.approver = 'dan')
  
) AS UNUSED_TABLE_NAME  ),
t_0_Effective AS (SELECT
  Effective_MultBodyAggAux.approver AS approver,
  Effective_MultBodyAggAux.requester AS requester
FROM
  t_1_Effective_MultBodyAggAux AS Effective_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  Effective.approver AS approver
FROM
  t_0_Effective AS Effective
WHERE
  (Effective.requester = 'bea')
GROUP BY 1 ORDER BY approver;
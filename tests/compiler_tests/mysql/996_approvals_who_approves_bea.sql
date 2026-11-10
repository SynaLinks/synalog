-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
      ((SELECT
        MIN(1) AS synalog_value
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (ApproverOf.approver = 'dan')) IS NULL)
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
SELECT * FROM (
SELECT
  Effective.approver AS approver
FROM
  t_0_Effective AS Effective
WHERE
  (Effective.requester = 'bea')
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY approver IS NULL, approver;
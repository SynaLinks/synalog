-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS r,
      'ax' AS p,
      3 AS q,
      10.0e0 AS pr
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS r,
      'ax' AS p,
      null AS q,
      10.0e0 AS pr
   UNION ALL
  
    SELECT
      3 AS id,
      'north' AS r,
      'bo' AS p,
      5 AS q,
      4.0e0 AS pr
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS r,
      'ax' AS p,
      1 AS q,
      12.0e0 AS pr
   UNION ALL
  
    SELECT
      5 AS id,
      'south' AS r,
      'cy' AS p,
      7 AS q,
      null AS pr
   UNION ALL
  
    SELECT
      6 AS id,
      'south' AS r,
      'cy' AS p,
      2 AS q,
      3.0e0 AS pr
   UNION ALL
  
    SELECT
      7 AS id,
      'east' AS r,
      'bo' AS p,
      null AS q,
      null AS pr
   UNION ALL
  
    SELECT
      8 AS id,
      null AS r,
      'ax' AS p,
      4 AS q,
      9.0e0 AS pr
   UNION ALL
  
    SELECT
      9 AS id,
      null AS r,
      'dz' AS p,
      6 AS q,
      1.0e0 AS pr
   UNION ALL
  
    SELECT
      10 AS id,
      'east' AS r,
      'dz' AS p,
      8 AS q,
      2.0e0 AS pr
   UNION ALL
  
    SELECT
      11 AS id,
      'north' AS r,
      'cy' AS p,
      3 AS q,
      6.0e0 AS pr
   UNION ALL
  
    SELECT
      12 AS id,
      'west' AS r,
      'ax' AS p,
      9 AS q,
      10.0e0 AS pr
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  (MOD(S.id, NULLIF(6, 0))) AS k,
  SUM(S.pr) AS v
FROM
  t_0_S AS S
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY k IS NULL, k;
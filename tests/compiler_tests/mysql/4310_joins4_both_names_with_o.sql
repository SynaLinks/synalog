-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      null AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      null AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      null AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  E.n AS a,
  t_0_E.n AS b
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (E.id < t_0_E.id) AND
  (E.n LIKE '%o%' ESCAPE '\') AND
  (t_0_E.n LIKE '%o%' ESCAPE '\')
) AS UNUSED_TABLE_NAME ORDER BY a IS NULL, a, b IS NULL, b;
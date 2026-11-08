-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_4_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(JSON_OBJECT('n', t_2_N.n, 's', t_2_N.s)), '$[0]') ORDER BY t_2_N.n DESC SEPARATOR ','), ']') AS JSON), '$[0]') AS best
FROM
  t_4_N AS t_2_N)
SELECT
  JSON_EXTRACT(t_0_A.best, '$."s"') AS s
FROM
  t_1_A AS t_0_A;
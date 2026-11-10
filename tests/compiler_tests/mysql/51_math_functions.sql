-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Numbers AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT * FROM (
SELECT
  Numbers.x AS x,
  EXP(CAST(Numbers.x AS DOUBLE)) AS e,
  LN(CAST(Numbers.x AS DOUBLE)) AS l,
  SIN(CAST(Numbers.x AS DOUBLE)) AS s,
  COS(CAST(Numbers.x AS DOUBLE)) AS c,
  POW(Numbers.x, 2) AS p
FROM
  t_1_Numbers AS Numbers
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x)
SELECT * FROM (
SELECT
  Computed.x AS x,
  Computed.e AS e,
  Computed.l AS l,
  Computed.s AS s,
  Computed.c AS c,
  Computed.p AS p
FROM
  t_0_Computed AS Computed
) AS UNUSED_TABLE_NAME ORDER BY x IS NULL, x;
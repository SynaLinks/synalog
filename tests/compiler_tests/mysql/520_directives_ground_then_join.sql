-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_test DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_test.G;
CREATE TABLE synalog_test.G AS SELECT
  JSON_VALUE(x_1.value, '$' RETURNING DOUBLE) AS k
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_1;

-- Interacting with table synalog_test.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_test.G AS G, t_0_N AS N
WHERE
  (N.k = G.k);
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;
CREATE DATABASE IF NOT EXISTS synalog_home DEFAULT COLLATE utf8mb4_0900_bin;

DROP TABLE IF EXISTS synalog_home.T;
CREATE TABLE synalog_home.T AS SELECT
  SUM(JSON_VALUE(x_2.value, '$' RETURNING DOUBLE)) AS t
FROM
  LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY(1, 2) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_2;

-- Interacting with table synalog_home.T

SELECT
  t_0_T.t AS a,
  t_1_T.t AS b
FROM
  synalog_home.T AS t_0_T, synalog_home.T AS t_1_T;
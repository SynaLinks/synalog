-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  (CASE WHEN CAST(CONCAT('[', REPLACE(JSON_QUOTE('a::b::c'), SUBSTR(JSON_QUOTE('::'), 2, CHAR_LENGTH(JSON_QUOTE('::')) - 2), '","'), ']') AS JSON) IS NULL OR '::' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(synalog_j.v ORDER BY synalog_j.i SEPARATOR '::') FROM (SELECT CAST(CONCAT('[', REPLACE(JSON_QUOTE('a::b::c'), SUBSTR(JSON_QUOTE('::'), 2, CHAR_LENGTH(JSON_QUOTE('::')) - 2), '","'), ']') AS JSON) AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (i FOR ORDINALITY, v TEXT COLLATE utf8mb4_0900_bin PATH '$')) AS synalog_j), '') END) AS s;
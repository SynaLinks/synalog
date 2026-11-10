-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  JSON_LENGTH(CAST(CONCAT('[', REPLACE(JSON_QUOTE('one--two'), SUBSTR(JSON_QUOTE('--'), 2, CHAR_LENGTH(JSON_QUOTE('--')) - 2), '","'), ']') AS JSON)) AS n,
  (JSON_UNQUOTE(NULLIF((CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(CAST(CONCAT('[', REPLACE(JSON_QUOTE('one--two'), SUBSTR(JSON_QUOTE('--'), 2, CHAR_LENGTH(JSON_QUOTE('--')) - 2), '","'), ']') AS JSON), CONCAT('$[', 0, ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS first,
  (JSON_UNQUOTE(NULLIF((CASE WHEN ((JSON_LENGTH(CAST(CONCAT('[', REPLACE(JSON_QUOTE('one--two'), SUBSTR(JSON_QUOTE('--'), 2, CHAR_LENGTH(JSON_QUOTE('--')) - 2), '","'), ']') AS JSON))) - (1)) < 0 THEN NULL ELSE JSON_EXTRACT(CAST(CONCAT('[', REPLACE(JSON_QUOTE('one--two'), SUBSTR(JSON_QUOTE('--'), 2, CHAR_LENGTH(JSON_QUOTE('--')) - 2), '","'), ']') AS JSON), CONCAT('$[', ((JSON_LENGTH(CAST(CONCAT('[', REPLACE(JSON_QUOTE('one--two'), SUBSTR(JSON_QUOTE('--'), 2, CHAR_LENGTH(JSON_QUOTE('--')) - 2), '","'), ']') AS JSON))) - (1)), ']')) END), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS last;
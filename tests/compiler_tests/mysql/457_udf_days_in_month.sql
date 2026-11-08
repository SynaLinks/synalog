-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

SELECT
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2024, NULLIF(4, 0))) = 0) AND (((MOD(2024, NULLIF(100, 0))) != 0) OR ((MOD(2024, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS a,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, NULLIF(4, 0))) = 0) AND (((MOD(2023, NULLIF(100, 0))) != 0) OR ((MOD(2023, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS b,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(2000, NULLIF(4, 0))) = 0) AND (((MOD(2000, NULLIF(100, 0))) != 0) OR ((MOD(2000, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS c,
  CASE WHEN (2 = 2) THEN ((28) + (CASE WHEN (((MOD(1900, NULLIF(4, 0))) = 0) AND (((MOD(1900, NULLIF(100, 0))) != 0) OR ((MOD(1900, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((2 = 4) OR (2 = 6)) OR (2 = 9)) OR (2 = 11)) THEN 30 ELSE 31 END AS d,
  CASE WHEN (4 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, NULLIF(4, 0))) = 0) AND (((MOD(2023, NULLIF(100, 0))) != 0) OR ((MOD(2023, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((4 = 4) OR (4 = 6)) OR (4 = 9)) OR (4 = 11)) THEN 30 ELSE 31 END AS e,
  CASE WHEN (12 = 2) THEN ((28) + (CASE WHEN (((MOD(2023, NULLIF(4, 0))) = 0) AND (((MOD(2023, NULLIF(100, 0))) != 0) OR ((MOD(2023, NULLIF(400, 0))) = 0))) THEN 1 ELSE 0 END)) WHEN ((((12 = 4) OR (12 = 6)) OR (12 = 9)) OR (12 = 11)) THEN 30 ELSE 31 END AS f;
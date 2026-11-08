-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('k', 'a', 'v', 'x') AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('k', 'b', 'v', 'y') AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(t_0_V.r, '$."v"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS v
FROM
  t_1_V AS t_0_V
WHERE
  ((JSON_UNQUOTE(NULLIF(JSON_EXTRACT(t_0_V.r, '$."k"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) = 'b');
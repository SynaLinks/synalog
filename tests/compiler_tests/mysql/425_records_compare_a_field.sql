-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('k', 1, 's', 'a') AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('k', 2, 's', 'b') AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(V.r, '$."s"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS s
FROM
  t_0_V AS V
WHERE
  (JSON_VALUE(JSON_EXTRACT(V.r, '$."k"'), '$' RETURNING DOUBLE) > 1);
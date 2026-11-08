-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_OBJECT('name', 'Alice', 'contact', JSON_OBJECT('email', 'alice@example.com', 'phone', '123')) AS info
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_OBJECT('name', 'Bob', 'contact', JSON_OBJECT('email', 'bob@example.com', 'phone', '456')) AS info
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Person.id AS id,
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(Person.info, '$."name"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS name,
  (JSON_UNQUOTE(NULLIF(JSON_EXTRACT(NULLIF(JSON_EXTRACT(Person.info, '$."contact"'), CAST('null' AS JSON)), '$."email"'), CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin) AS email
FROM
  t_0_Person AS Person
) AS UNUSED_TABLE_NAME ORDER BY id IS NULL, id;
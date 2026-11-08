-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Person AS (SELECT * FROM (
  
    SELECT
      'ann' AS name,
      1 AS city_id
   UNION ALL
  
    SELECT
      'bob' AS name,
      2 AS city_id
  
) AS UNUSED_TABLE_NAME  ),
t_2_City AS (SELECT * FROM (
  
    SELECT
      1 AS city_id,
      'paris' AS city
   UNION ALL
  
    SELECT
      2 AS city_id,
      'rome' AS city
   UNION ALL
  
    SELECT
      3 AS city_id,
      'oslo' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Person.name AS name,
  t_0_City.city AS city
FROM
  t_1_Person AS Person, t_2_City AS t_0_City
WHERE
  (t_0_City.city_id = Person.city_id)
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;
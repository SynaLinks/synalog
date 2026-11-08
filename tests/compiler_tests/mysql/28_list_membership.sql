-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_0_Items AS (SELECT * FROM (
  
    SELECT
      'apple' AS col0,
      'fruit' AS col1,
      1.50e0 AS col2
   UNION ALL
  
    SELECT
      'banana' AS col0,
      'fruit' AS col1,
      0.75e0 AS col2
   UNION ALL
  
    SELECT
      'carrot' AS col0,
      'vegetable' AS col1,
      0.50e0 AS col2
   UNION ALL
  
    SELECT
      'milk' AS col0,
      'dairy' AS col1,
      2.00e0 AS col2
   UNION ALL
  
    SELECT
      'bread' AS col0,
      'grain' AS col1,
      1.25e0 AS col2
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
SELECT
  Items.col0 AS name,
  Items.col2 AS price
FROM
  t_0_Items AS Items, LATERAL (SELECT synalog_u.value FROM (SELECT JSON_ARRAY('fruit', 'vegetable') AS synalog_a) AS synalog_s, JSON_TABLE(synalog_s.synalog_a, '$[*]' COLUMNS (value JSON PATH '$')) AS synalog_u) AS x_9
WHERE
  (Items.col1 = (JSON_UNQUOTE(NULLIF(x_9.value, CAST('null' AS JSON))) COLLATE utf8mb4_0900_bin))
) AS UNUSED_TABLE_NAME ORDER BY name IS NULL, name;
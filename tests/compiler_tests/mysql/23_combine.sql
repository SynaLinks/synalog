-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_ARRAY('a', 'b') AS tags
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_ARRAY('c') AS tags
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_ARRAY('a', 'd', 'e') AS tags
  
) AS UNUSED_TABLE_NAME  ),
t_0_AllTags AS (SELECT
  (CASE WHEN COUNT(Items.tags) > 0 THEN CAST(CONCAT('[', COALESCE(GROUP_CONCAT(NULLIF(SUBSTR(CAST(Items.tags AS CHAR), 2, CHAR_LENGTH(CAST(Items.tags AS CHAR)) - 2), '') SEPARATOR ','), ''), ']') AS JSON) END) AS synalog_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  (CASE WHEN COUNT(CASE WHEN (JSON_LENGTH(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE JSON_ARRAY() END) > 0 THEN CAST(CONCAT('[', COALESCE(GROUP_CONCAT(NULLIF(SUBSTR(CAST(CASE WHEN (JSON_LENGTH(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE JSON_ARRAY() END AS CHAR), 2, CHAR_LENGTH(CAST(CASE WHEN (JSON_LENGTH(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE JSON_ARRAY() END AS CHAR)) - 2), '') SEPARATOR ','), ''), ']') AS JSON) END) AS synalog_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.synalog_value AS all_tags,
  FilteredTags.synalog_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;
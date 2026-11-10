-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_1_Items AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ['a', 'b'] AS tags
   UNION ALL
  
    SELECT
      2 AS id,
      ['c'] AS tags
   UNION ALL
  
    SELECT
      3 AS id,
      ['a', 'd', 'e'] AS tags
  
) AS UNUSED_TABLE_NAME  ),
t_0_AllTags AS (SELECT
  arrayFlatten(groupArray(Items.tags)) AS synalog_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  arrayFlatten(groupArray(CASE WHEN (length(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE [] END)) AS synalog_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.synalog_value AS all_tags,
  FilteredTags.synalog_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;
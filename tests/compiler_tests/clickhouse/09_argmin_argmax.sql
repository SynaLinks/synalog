-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

WITH t_2_Score AS (SELECT * FROM (
  
    SELECT
      'Alice' AS player,
      85 AS points
   UNION ALL
  
    SELECT
      'Bob' AS player,
      92 AS points
   UNION ALL
  
    SELECT
      'Charlie' AS player,
      78 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestPlayer AS (SELECT
  argMax(Score.player, Score.points) AS synalog_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  argMin(t_4_Score.player, t_4_Score.points) AS synalog_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.synalog_value AS best,
  WorstPlayer.synalog_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;
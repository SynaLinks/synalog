-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Score.player), '$[0]') ORDER BY Score.points DESC SEPARATOR ','), ']') AS JSON), '$[0]') AS synalog_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(t_4_Score.player), '$[0]') ORDER BY t_4_Score.points IS NULL ASC, t_4_Score.points ASC SEPARATOR ','), ']') AS JSON), '$[0]') AS synalog_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.synalog_value AS best,
  WorstPlayer.synalog_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;
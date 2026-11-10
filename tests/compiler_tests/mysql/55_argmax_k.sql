-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

WITH t_3_Score AS (SELECT * FROM (
  
    SELECT
      'A' AS team,
      'p1' AS player,
      10 AS points
   UNION ALL
  
    SELECT
      'A' AS team,
      'p2' AS player,
      30 AS points
   UNION ALL
  
    SELECT
      'A' AS team,
      'p3' AS player,
      20 AS points
   UNION ALL
  
    SELECT
      'B' AS team,
      'p4' AS player,
      50 AS points
   UNION ALL
  
    SELECT
      'B' AS team,
      'p5' AS player,
      40 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_TeamLeaders AS (SELECT * FROM (
SELECT
  Score.team AS team,
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Score.player), '$[0]') ORDER BY Score.points DESC SEPARATOR ','), ']') AS JSON), CONCAT('$[0 to ', 2 - 1, ']')) AS top2,
  JSON_EXTRACT(CAST(CONCAT('[', GROUP_CONCAT(JSON_EXTRACT(JSON_ARRAY(Score.player), '$[0]') ORDER BY Score.points IS NULL ASC, Score.points ASC SEPARATOR ','), ']') AS JSON), CONCAT('$[0 to ', 1 - 1, ']')) AS bottom1
FROM
  t_3_Score AS Score
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY team IS NULL, team)
SELECT * FROM (
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders
) AS UNUSED_TABLE_NAME ORDER BY team IS NULL, team;
-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing ClickHouse environment.
SET join_use_nulls = 1;
SET allow_experimental_correlated_subqueries = 1;
SET aggregate_functions_null_for_empty = 1;
SET cast_keep_nullable = 1;
SET transform_null_in = 1;

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
t_0_TeamLeaders AS (SELECT
  Score.team AS team,
  arraySlice(arrayMap(t -> t.2, arrayReverseSort(t -> t.1, groupArray(tuple(Score.points, Score.player)))), 1, 2) AS top2,
  arraySlice(arrayMap(t -> t.2, arraySort(t -> t.1, groupArray(tuple(Score.points, Score.player)))), 1, 1) AS bottom1
FROM
  t_3_Score AS Score
GROUP BY 1 ORDER BY team)
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders ORDER BY team;
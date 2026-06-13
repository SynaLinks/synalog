WITH t_3_Score AS (SELECT * FROM (
  
    SELECT
      "A" AS team,
      "p1" AS player,
      10 AS points
   UNION ALL
  
    SELECT
      "A" AS team,
      "p2" AS player,
      30 AS points
   UNION ALL
  
    SELECT
      "A" AS team,
      "p3" AS player,
      20 AS points
   UNION ALL
  
    SELECT
      "B" AS team,
      "p4" AS player,
      50 AS points
   UNION ALL
  
    SELECT
      "B" AS team,
      "p5" AS player,
      40 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_TeamLeaders AS (SELECT
  Score.team AS team,
  SLICE(ARRAY_AGG(Score.player order by Score.points desc), 1, 2) AS top2,
  SLICE(ARRAY_AGG(Score.player order by Score.points), 1, 1) AS bottom1
FROM
  t_3_Score AS Score
GROUP BY 1 ORDER BY team)
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders ORDER BY team;
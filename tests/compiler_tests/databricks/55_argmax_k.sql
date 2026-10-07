WITH t_3_Score AS (SELECT * FROM VALUES
  ("A", "p1", 10),
  ("A", "p2", 30),
  ("A", "p3", 20),
  ("B", "p4", 50),
  ("B", "p5", 40)
AS UNUSED_TABLE_NAME(team, player, points)),
t_0_TeamLeaders AS (SELECT
  Score.team AS team,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT(Score.points AS value, Score.player AS arg)), false), 1, 2), s -> s.arg) END) AS top2,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT(Score.points AS value, Score.player AS arg))), 1, 1), s -> s.arg) END) AS bottom1
FROM
  t_3_Score AS Score
GROUP BY 1 ORDER BY team NULLS LAST)
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders ORDER BY team NULLS LAST;
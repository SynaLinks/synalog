WITH t_2_Score AS (SELECT * FROM (
  
    SELECT
      "Alice" AS player,
      85 AS points
   UNION ALL
  
    SELECT
      "Bob" AS player,
      92 AS points
   UNION ALL
  
    SELECT
      "Charlie" AS player,
      78 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestPlayer AS (SELECT
  ARRAY_AGG(Score.player order by  [Score.points][offset(0)] desc limit 1)[OFFSET(0)] AS logica_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  ARRAY_AGG(t_4_Score.player order by [t_4_Score.points][offset(0)] limit 1)[OFFSET(0)] AS logica_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.logica_value AS best,
  WorstPlayer.logica_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;
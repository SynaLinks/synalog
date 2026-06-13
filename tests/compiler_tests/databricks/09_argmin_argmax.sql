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
  SORT_ARRAY(COLLECT_LIST(STRUCT(Score.points AS value, Score.player AS arg)), false)[0].arg AS logica_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_4_Score.points AS value, t_4_Score.player AS arg)))[0].arg AS logica_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.logica_value AS best,
  WorstPlayer.logica_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;
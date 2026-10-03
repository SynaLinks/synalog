WITH t_1_Score AS (SELECT * FROM (
  
    SELECT
      "a" AS name,
      1 AS s
   UNION ALL
  
    SELECT
      "b" AS name,
      5 AS s
   UNION ALL
  
    SELECT
      "c" AS name,
      3 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(Score.name order by  [Score.s][offset(0)] desc limit 1)[OFFSET(0)] AS name
FROM
  t_1_Score AS Score;
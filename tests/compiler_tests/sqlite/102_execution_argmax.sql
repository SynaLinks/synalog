WITH t_1_Score AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      1 AS s
   UNION ALL
  
    SELECT
      'b' AS name,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS name,
      3 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(ArgMax(Score.name, Score.s, 1), '$[' || 0 || ']') AS name
FROM
  t_1_Score AS Score;
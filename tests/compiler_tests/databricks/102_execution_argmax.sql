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
  SORT_ARRAY(COLLECT_LIST(STRUCT(Score.s AS value, Score.name AS arg)), false)[0].arg AS name
FROM
  t_1_Score AS Score;
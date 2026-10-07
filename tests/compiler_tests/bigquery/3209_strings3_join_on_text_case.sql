WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      "x" AS k,
      10 AS b
   UNION ALL
  
    SELECT
      "X" AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.b AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = "x");
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      null AS v
   UNION ALL
  
    SELECT
      7 AS v
   UNION ALL
  
    SELECT
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(t_0_V.v) AS m
FROM
  t_1_V AS t_0_V;
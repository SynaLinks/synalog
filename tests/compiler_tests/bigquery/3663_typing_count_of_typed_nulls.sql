WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      7 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(CASE WHEN (t_0_V.v IS null) THEN 1 ELSE 0 END) AS n
FROM
  t_1_V AS t_0_V;
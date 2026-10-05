WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'c' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ArgMin(t_0_V.v, t_0_V.k, null) AS l
FROM
  t_2_V AS t_0_V;
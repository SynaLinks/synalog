WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      2.5E0 AS x
   UNION ALL
  
    SELECT
      1000000 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(((((t_0_V.x) * (t_0_V.x))) * (2.5E0))) AS v
FROM
  t_1_V AS t_0_V;
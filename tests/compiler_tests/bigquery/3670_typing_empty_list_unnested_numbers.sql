WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      ARRAY[1, 2] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_V AS V, UNNEST(V.l) as x_1;
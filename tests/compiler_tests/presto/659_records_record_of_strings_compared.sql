WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW('a', 'x') AS ROW(k varchar, v varchar)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW('b', 'y') AS ROW(k varchar, v varchar)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.r.v AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.r.k = 'b');
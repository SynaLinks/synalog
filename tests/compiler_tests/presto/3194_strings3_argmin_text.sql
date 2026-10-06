WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'b' AS w
   UNION ALL
  
    SELECT
      2 AS id,
      'B' AS w
   UNION ALL
  
    SELECT
      3 AS id,
      'c' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (ARRAY_AGG(V.id order by V.w))[1] AS id
FROM
  t_1_V AS V;
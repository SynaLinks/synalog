WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      ARRAY[5, 5, 9, 1] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(x_4 order by [- x_4][offset(0)]) AS s
FROM
  t_3_L AS t_0_L, UNNEST(t_0_L.l) as x_4
WHERE
  (t_0_L.k = 3);
WITH t_1_L AS (SELECT * FROM (
  
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
  t_0_L.k AS k
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3
WHERE
  (4 = x_3) ORDER BY k NULLS LAST;
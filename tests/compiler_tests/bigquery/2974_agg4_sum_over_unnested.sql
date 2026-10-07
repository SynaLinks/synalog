WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      "a" AS k,
      ARRAY[1, 2, 3] AS l
   UNION ALL
  
    SELECT
      "b" AS k,
      ARRAY[10] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  SUM(x_3) AS t
FROM
  t_1_L AS t_0_L, UNNEST(t_0_L.l) as x_3
GROUP BY k ORDER BY k NULLS LAST, t NULLS LAST;
WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[1, 2] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  CARDINALITY(B.l) AS n
FROM
  t_0_B AS B ORDER BY k;
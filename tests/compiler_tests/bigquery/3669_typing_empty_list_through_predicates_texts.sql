WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY["a", "b"] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  ARRAY_LENGTH(B.l) AS n
FROM
  t_0_B AS B ORDER BY k;
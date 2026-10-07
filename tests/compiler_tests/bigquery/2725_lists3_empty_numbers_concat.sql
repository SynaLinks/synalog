WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[3, 4] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      ARRAY[5] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.k AS k,
  ARRAY_LENGTH(ARRAY_CONCAT(F.l, ARRAY[9])) AS n
FROM
  t_0_F AS F ORDER BY k;
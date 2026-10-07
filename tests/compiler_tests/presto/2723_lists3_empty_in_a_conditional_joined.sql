WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  ARRAY_JOIN(CASE WHEN (V.k = 1) THEN ARRAY[] ELSE ARRAY['a', 'b'] END, ',') AS s
FROM
  t_0_V AS V ORDER BY k;
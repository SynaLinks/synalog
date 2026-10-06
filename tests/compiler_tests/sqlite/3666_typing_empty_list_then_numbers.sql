WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(1, 2) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  JSON_ARRAY_LENGTH(V.l) AS n
FROM
  t_0_V AS V ORDER BY k;
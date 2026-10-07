WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY(1, 2) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.k AS k,
  JSON_ARRAY_LENGTH(F.l) AS n
FROM
  t_0_F AS F ORDER BY k;
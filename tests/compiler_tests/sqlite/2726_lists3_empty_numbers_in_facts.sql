WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(3, 4) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(5) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.k AS k,
  JSON_ARRAY_LENGTH(F.l) AS n
FROM
  t_0_F AS F ORDER BY k;
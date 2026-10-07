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
  SUM(x_3.value) AS t
FROM
  t_0_F AS F, JSON_EACH(F.l) as x_3
GROUP BY F.k ORDER BY k;
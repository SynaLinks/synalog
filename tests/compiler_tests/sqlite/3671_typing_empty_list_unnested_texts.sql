WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      JSON_ARRAY('a', 'b') AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_V AS V, JSON_EACH(V.l) as x_1;
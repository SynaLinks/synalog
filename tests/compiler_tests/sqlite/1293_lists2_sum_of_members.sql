WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_ARRAY(3, 1, 2) AS l
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS id,
      JSON_ARRAY(5) AS l
   UNION ALL
  
    SELECT
      4 AS id,
      JSON_ARRAY(7, 7, 8, 9) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  SUM(x_3.value) AS s
FROM
  t_1_L AS t_0_L, JSON_EACH(t_0_L.l) as x_3
GROUP BY t_0_L.id ORDER BY id NULLS LAST, s NULLS LAST;

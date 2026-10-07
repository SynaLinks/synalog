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
  x_2.value AS x
FROM
  t_1_L AS t_0_L, JSON_EACH(t_0_L.l) as x_2
GROUP BY x_2.value ORDER BY x NULLS LAST;

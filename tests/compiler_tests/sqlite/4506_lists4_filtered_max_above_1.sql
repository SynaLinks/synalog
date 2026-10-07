WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_ARRAY(1, 2, 3) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      JSON_ARRAY(7) AS l
   UNION ALL
  
    SELECT
      4 AS k,
      JSON_ARRAY(5, 5, 9, 1) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  MAX(MagicalEntangle(x_5.value, x_6.value)) AS logica_value
FROM
  JSON_EACH(t_0_L.l) as x_5, JSON_EACH(JSON_ARRAY(0)) as x_6
WHERE
  (x_5.value > 1)) AS m
FROM
  t_1_L AS t_0_L ORDER BY k NULLS LAST;
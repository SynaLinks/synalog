WITH t_3_L AS (SELECT * FROM (
  
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
   UNION ALL
  
    SELECT
      5 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  (SELECT
  ArgMin(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', - x_7.value, 'value', x_7.value), x_8.value), "$.value"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', - x_7.value, 'value', x_7.value), x_8.value), "$.arg"), null) AS logica_value
FROM
  JSON_EACH(t_0_L.l) as x_7, JSON_EACH(JSON_ARRAY(0)) as x_8) AS v
FROM
  t_3_L AS t_0_L ORDER BY k NULLS LAST;
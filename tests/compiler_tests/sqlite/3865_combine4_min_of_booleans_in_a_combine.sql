WITH t_1_U AS (SELECT * FROM (
  
    SELECT
      1 AS u
   UNION ALL
  
    SELECT
      2 AS u
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_U.u AS u,
  (SELECT
  MIN(MagicalEntangle(false, x_4.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_4
WHERE
  (t_0_U.u = 1)) AS l
FROM
  t_1_U AS t_0_U ORDER BY u NULLS LAST;
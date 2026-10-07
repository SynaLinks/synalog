WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      0 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_4
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_8.value)) AS logica_value
  FROM
    t_0_E AS E, JSON_EACH(JSON_ARRAY(0)) as x_8
  WHERE
    (E.b < x_4.value) AND
    (E.a = x_4.value)) IS NULL);
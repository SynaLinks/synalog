WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (V.g = 'a') AND
    (V.x = 1)) IS NULL);
WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.a AS a,
  P.b AS b
FROM
  t_0_P AS P
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (P.a = 1) AND
    (P.b = 1)) IS NULL);
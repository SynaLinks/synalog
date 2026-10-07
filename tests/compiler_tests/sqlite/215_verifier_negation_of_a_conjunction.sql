WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    t_0_B AS B, JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (B.x = x_3.value) AND
    (x_3.value = 2)) IS NULL) ORDER BY x;
WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2)) as x_3
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_6.value)) AS logica_value
  FROM
    t_1_X AS t_0_X, JSON_EACH(JSON_ARRAY(0)) as x_6
  WHERE
    (t_0_X.x = x_3.value)) IS NULL) ORDER BY x NULLS LAST;
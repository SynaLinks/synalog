WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.x AS x
FROM
  t_0_R AS R
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_3.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_3
  WHERE
    (R.x IS NULL)) IS NULL);
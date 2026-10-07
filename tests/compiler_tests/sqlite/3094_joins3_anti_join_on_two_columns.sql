WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y,
      1 AS id
   UNION ALL
  
    SELECT
      1 AS x,
      3 AS y,
      2 AS id
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.id AS id
FROM
  t_0_A AS A
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_7.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_7
  WHERE
    (A.x = 1) AND
    (A.y = 2)) IS NULL);
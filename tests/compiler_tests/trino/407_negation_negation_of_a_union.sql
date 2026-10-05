WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_U AS U
  WHERE
    (U.x = x_3)) IS NULL);
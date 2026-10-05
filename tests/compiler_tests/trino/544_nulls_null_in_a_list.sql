WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V, UNNEST(ARRAY[1, 2]) as pushkin(x_2)
WHERE
  (V.x = x_2);
WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_B AS B
  WHERE
    (B.x = x_3) AND
    (x_3 = 2)) IS NULL) ORDER BY x;
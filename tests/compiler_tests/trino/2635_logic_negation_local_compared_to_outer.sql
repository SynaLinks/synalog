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
  x_4 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E
  WHERE
    (E.b < x_4) AND
    (E.a = x_4)) IS NULL);
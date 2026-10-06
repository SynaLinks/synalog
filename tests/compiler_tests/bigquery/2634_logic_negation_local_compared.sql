WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      9 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_4
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E
  WHERE
    (E.b > 5) AND
    (E.a = x_4)) IS NULL) ORDER BY x;
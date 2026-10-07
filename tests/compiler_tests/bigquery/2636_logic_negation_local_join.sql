WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      8 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      7 AS b
   UNION ALL
  
    SELECT
      8 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4 AS x
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_4
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_E AS E, t_1_L AS L
  WHERE
    (E.a = x_4) AND
    (L.b = E.b)) IS NULL) ORDER BY x;
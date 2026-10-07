WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_2_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      "x" AS s
   UNION ALL
  
    SELECT
      2 AS n,
      "y" AS s
   UNION ALL
  
    SELECT
      3 AS n,
      "z" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_N.n AS n,
  (SELECT
  SUM(1) AS logica_value
FROM
  t_1_E AS E
WHERE
  (E.a = t_0_N.n)) AS c
FROM
  t_2_N AS t_0_N ORDER BY n NULLS LAST;
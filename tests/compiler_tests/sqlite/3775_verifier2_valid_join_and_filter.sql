WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  E.a AS a,
  t_0_E.b AS c
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (t_0_E.a = E.b);
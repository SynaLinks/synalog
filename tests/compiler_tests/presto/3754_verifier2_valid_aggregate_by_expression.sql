WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ((MOD(E.a, NULLIF(2, 0))) = 1) AS odd,
  SUM(1) AS n
FROM
  t_0_E AS E
GROUP BY 1 ORDER BY odd;
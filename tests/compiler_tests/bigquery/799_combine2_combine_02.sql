WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      3 AS s
   UNION ALL
  
    SELECT
      "b" AS n,
      9 AS s
   UNION ALL
  
    SELECT
      "c" AS n,
      1 AS s
   UNION ALL
  
    SELECT
      "d" AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  MAX(V.s) AS logica_value
FROM
  t_0_V AS V) AS t;
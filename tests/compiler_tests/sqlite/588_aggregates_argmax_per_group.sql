WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      'a' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'x' AS g,
      'b' AS n,
      2 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'c' AS n,
      7 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  JSON_EXTRACT(ArgMax(V.n, V.s, 1), '$[' || 0 || ']') AS w
FROM
  t_1_V AS V
GROUP BY V.g ORDER BY g;
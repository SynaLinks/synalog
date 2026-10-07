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
      9 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'd' AS n,
      4 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMin(V.n, V.s, 1), '$[' || 0 || ']') END) AS w
FROM
  t_1_V AS V
GROUP BY V.g ORDER BY g NULLS LAST;
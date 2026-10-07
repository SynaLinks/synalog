WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      5 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMax(V.n, V.s, 1), '$[' || 0 || ']') END) AS w
FROM
  t_1_V AS V;
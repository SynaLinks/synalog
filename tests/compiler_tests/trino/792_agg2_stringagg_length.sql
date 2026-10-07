WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      3 AS s
   UNION ALL
  
    SELECT
      'b' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'c' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'd' AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_J AS (SELECT
  (CASE WHEN COUNT(V.n) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST(V.n AS VARCHAR)), ',') END) AS j
FROM
  t_2_V AS V)
SELECT
  LENGTH(t_0_J.j) AS n
FROM
  t_1_J AS t_0_J;
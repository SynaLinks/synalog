WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'b' AS s,
      3 AS n
   UNION ALL
  
    SELECT
      'a' AS s,
      1 AS n
   UNION ALL
  
    SELECT
      'a' AS s,
      2 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.s AS s,
  V.n AS n
FROM
  t_0_V AS V ORDER BY s, n desc;
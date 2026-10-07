WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'xa' AS s,
      'q' AS t
   UNION ALL
  
    SELECT
      2 AS n,
      'b' AS s,
      'xy' AS t
   UNION ALL
  
    SELECT
      3 AS n,
      'c' AS s,
      'd' AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.n AS n,
  V.s AS s,
  V.t AS t
FROM
  t_0_V AS V ORDER BY n;
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      7 AS n,
      'x' AS t
   UNION ALL
  
    SELECT
      8 AS n,
      'a7' AS t
   UNION ALL
  
    SELECT
      9 AS n,
      'b' AS t
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.n AS n,
  V.t AS t
FROM
  t_0_V AS V ORDER BY n;
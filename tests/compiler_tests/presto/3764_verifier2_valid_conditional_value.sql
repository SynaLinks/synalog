WITH t_1_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_N.n AS n,
  CASE WHEN (t_0_N.n > 1) THEN 'big' ELSE 'small' END AS w
FROM
  t_1_N AS t_0_N ORDER BY n;
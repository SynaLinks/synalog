WITH t_2_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      "x" AS s
   UNION ALL
  
    SELECT
      2 AS n,
      "y" AS s
   UNION ALL
  
    SELECT
      3 AS n,
      "z" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(t_1_N.n) AS t
FROM
  t_2_N AS t_1_N
WHERE
  (t_1_N.n > 1);
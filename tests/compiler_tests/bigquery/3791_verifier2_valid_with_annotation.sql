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
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  t_1_N.n AS n
FROM
  t_2_N AS t_1_N)
SELECT
  SUM(1) AS c
FROM
  t_0_W AS W;
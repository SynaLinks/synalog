WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_2_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_0_J AS (SELECT
  A.k AS k
FROM
  t_1_A AS A, t_2_B AS B
WHERE
  (B.k = A.k)
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_J AS J;
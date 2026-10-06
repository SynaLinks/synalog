WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.k = A.k);
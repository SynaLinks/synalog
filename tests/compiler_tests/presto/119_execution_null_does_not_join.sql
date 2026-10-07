WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      null AS k,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      null AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.v AS v
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.k = A.k);
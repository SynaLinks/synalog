WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT(null AS v) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT(3 AS v) AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (A.r.v IS null) AND
  (B.k = A.k);
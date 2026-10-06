WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      null AS k,
      1 AS a
   UNION ALL
  
    SELECT
      5 AS k,
      2 AS a
   UNION ALL
  
    SELECT
      null AS k,
      3 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      null AS k,
      10 AS b
   UNION ALL
  
    SELECT
      5 AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a,
  t_1_B.b AS b
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);
WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.x AS x
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (B.x = A.x)
GROUP BY x;
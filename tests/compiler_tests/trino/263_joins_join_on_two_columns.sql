WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.a AS a,
  A.b AS b,
  'x' AS v
FROM
  t_0_A AS A
WHERE
  (A.a = 1) AND
  (A.b = 1);
WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a,
  t_0_A.b AS b,
  "x" AS v
FROM
  t_2_A AS t_0_A
WHERE
  (t_0_A.a = 1) AND
  (t_0_A.b = 1);
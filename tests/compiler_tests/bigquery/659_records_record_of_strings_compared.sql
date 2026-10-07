WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      STRUCT("a" AS k, "x" AS v) AS r
   UNION ALL
  
    SELECT
      STRUCT("b" AS k, "y" AS v) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.r.v AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.r.k = "b");
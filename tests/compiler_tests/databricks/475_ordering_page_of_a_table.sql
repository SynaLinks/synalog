WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      "d" AS k,
      4 AS v
   UNION ALL
  
    SELECT
      "a" AS k,
      1 AS v
   UNION ALL
  
    SELECT
      "c" AS k,
      3 AS v
   UNION ALL
  
    SELECT
      "b" AS k,
      2 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  T.v AS v
FROM
  t_0_T AS T ORDER BY k;
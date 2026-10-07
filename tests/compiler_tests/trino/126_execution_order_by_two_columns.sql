WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'b' AS k,
      3 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      2 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  R.v AS v
FROM
  t_0_R AS R ORDER BY k, v DESC;
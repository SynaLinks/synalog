WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  t_0_V.v AS v
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;
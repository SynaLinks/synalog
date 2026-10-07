WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      2 AS v
   UNION ALL
  
    SELECT
      2.5E0 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(U.v) AS s
FROM
  t_0_U AS U;
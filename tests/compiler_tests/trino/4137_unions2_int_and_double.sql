WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      2 AS k,
      2.5E0 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.v AS v
FROM
  t_0_U AS U ORDER BY k;
WITH t_0_U AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      (CAST(1 AS REAL) / NULLIF(2, 0)) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.k AS k,
  U.v AS v
FROM
  t_0_U AS U ORDER BY k NULLS LAST;
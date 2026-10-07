WITH t_0_WithNull AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_WithNull AS WithNull
WHERE
  (WithNull.x IS null);
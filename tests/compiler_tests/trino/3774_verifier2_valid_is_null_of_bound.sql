WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_V AS V
WHERE
  (V.x IS null);
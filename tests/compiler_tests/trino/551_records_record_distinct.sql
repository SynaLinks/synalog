WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(1) AS ROW(a double)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(1) AS ROW(a double)) AS r
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.r AS r
FROM
  t_1_V AS V
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      2.0 AS x
   UNION ALL
  
    SELECT
      2.0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.x AS x
FROM
  t_1_V AS V
GROUP BY x)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
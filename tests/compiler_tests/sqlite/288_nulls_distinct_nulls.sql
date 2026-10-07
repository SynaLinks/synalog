WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.x AS x
FROM
  t_1_V AS V
GROUP BY V.x)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
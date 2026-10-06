WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS w
   UNION ALL
  
    SELECT
      "A" AS w
   UNION ALL
  
    SELECT
      "a" AS w
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.w AS w
FROM
  t_1_V AS V
GROUP BY w)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;
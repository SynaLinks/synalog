WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      "a" AS s
   UNION ALL
  
    SELECT
      null AS s
   UNION ALL
  
    SELECT
      "b" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.s AS s
FROM
  t_0_V AS V ORDER BY s desc;
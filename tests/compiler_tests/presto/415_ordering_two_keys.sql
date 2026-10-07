WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      'b' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x
FROM
  t_0_V AS V ORDER BY g, x desc;
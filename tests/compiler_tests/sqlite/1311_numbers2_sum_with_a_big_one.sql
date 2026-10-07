WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      -7 AS x
   UNION ALL
  
    SELECT
      -2 AS x
   UNION ALL
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      12 AS x
   UNION ALL
  
    SELECT
      1099511627776 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(N.x) AS s
FROM
  t_0_N AS N;
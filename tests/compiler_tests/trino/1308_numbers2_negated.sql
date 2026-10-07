WITH t_1_N AS (SELECT * FROM (
  
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
  t_0_N.x AS x,
  - t_0_N.x AS n
FROM
  t_1_N AS t_0_N ORDER BY x, n;

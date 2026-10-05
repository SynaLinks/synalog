WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      "a" AS s
   UNION ALL
  
    SELECT
      2 AS x,
      "b" AS s
   UNION ALL
  
    SELECT
      3 AS x,
      "c" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (1 = N.x)
   UNION ALL
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (2 = N.x)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;
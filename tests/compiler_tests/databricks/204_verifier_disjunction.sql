SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      explode(ARRAY(1)) AS pushkin(x_3)
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      explode(ARRAY(2)) AS pushkin(x_3)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;
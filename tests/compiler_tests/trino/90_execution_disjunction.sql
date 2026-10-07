SELECT * FROM (
  
    SELECT
      1 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 3, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (x_3 = 1)
   UNION ALL
  
    SELECT
      5 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 3, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (x_3 = 5)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;
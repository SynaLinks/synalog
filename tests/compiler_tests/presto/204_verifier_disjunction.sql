SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;
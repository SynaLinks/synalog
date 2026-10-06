SELECT * FROM (
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2, 4], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;
SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      x_1 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
    WHERE
      (x_1 > 5)
  
) AS UNUSED_TABLE_NAME  ;
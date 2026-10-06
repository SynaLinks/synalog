SELECT * FROM (
  
    SELECT
      3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 3, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (3 < 0) AND
      (x_3 = 3)
   UNION ALL
  
    SELECT
      3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 3, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (3 > 5) AND
      (x_3 = 3)
  
) AS UNUSED_TABLE_NAME  ;
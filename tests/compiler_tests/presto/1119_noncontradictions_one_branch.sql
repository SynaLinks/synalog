SELECT * FROM (
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 5, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (x_3 < 3) AND
      (x_3 != 1)
   UNION ALL
  
    SELECT
      x_3 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 5, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      (x_3 > 7) AND
      (x_3 != 1)
  
) AS UNUSED_TABLE_NAME  ;
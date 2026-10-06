SELECT
  SUM(((x_5) * (x_5))) AS t
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_5);
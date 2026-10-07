SELECT
  MAX(((x_2) * (x_2))) AS m
FROM
  UNNEST(TRANSFORM(ARRAY[1, -3, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
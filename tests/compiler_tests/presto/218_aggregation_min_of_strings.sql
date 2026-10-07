SELECT
  MIN(x_2) AS m
FROM
  UNNEST(TRANSFORM(ARRAY['pear', 'apple', 'fig'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
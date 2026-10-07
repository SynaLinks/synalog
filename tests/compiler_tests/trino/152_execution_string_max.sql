SELECT
  MAX(x_2) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['apple', 'pear', 'fig'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);
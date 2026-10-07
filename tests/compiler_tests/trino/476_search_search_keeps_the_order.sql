SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['ant', 'zag', 'bee', 'bar'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY s desc;
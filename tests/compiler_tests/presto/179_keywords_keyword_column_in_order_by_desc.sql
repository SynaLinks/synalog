SELECT
  x_1 AS "order"
FROM
  UNNEST(TRANSFORM(ARRAY[2, 3, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY "order" DESC;
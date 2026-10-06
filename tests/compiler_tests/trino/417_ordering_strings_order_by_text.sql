SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['9', '10'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY s;
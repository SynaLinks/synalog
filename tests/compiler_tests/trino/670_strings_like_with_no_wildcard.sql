SELECT
  x_3 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['abc', 'abcd'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 LIKE 'abc' ESCAPE '\');
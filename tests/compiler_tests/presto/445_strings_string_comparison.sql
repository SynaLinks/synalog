SELECT
  x_3 AS w
FROM
  UNNEST(TRANSFORM(ARRAY['apple', 'pear'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 < 'banana');
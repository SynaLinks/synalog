SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['0x27 OR 1', 'other'], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1 != 'other');
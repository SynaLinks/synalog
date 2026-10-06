SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY[''');ATTACH DATABASE ''x'' AS y;--', 'other'], synalog_e -> ROW(synalog_e))) as pushkin(x_1)
WHERE
  (x_1 != 'other');
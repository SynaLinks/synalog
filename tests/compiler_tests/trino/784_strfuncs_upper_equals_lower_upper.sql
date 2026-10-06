SELECT
  SUM(1) AS n
FROM
  UNNEST(TRANSFORM(ARRAY['Apple', 'kiwi', 'Banana'], synalog_e -> ROW(synalog_e))) as pushkin(x_2)
WHERE
  (UPPER(LOWER(x_2)) = UPPER(x_2));
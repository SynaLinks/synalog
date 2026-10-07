SELECT
  UPPER(x_4) AS u
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_4) ORDER BY u;
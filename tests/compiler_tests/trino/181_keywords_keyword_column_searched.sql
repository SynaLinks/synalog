SELECT
  x_1 AS "group"
FROM
  UNNEST(TRANSFORM(ARRAY['a', 'b'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY "group";
SELECT
  x_1 AS s
FROM
  UNNEST(TRANSFORM(ARRAY['a''b', 'x\\''y', 'plain', '); DROP'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY s;
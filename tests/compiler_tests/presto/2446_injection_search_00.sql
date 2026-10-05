SELECT
  x_1 AS s
FROM
  UNNEST(ARRAY['a''b', 'x\\''y', 'plain', '); DROP']) as pushkin(x_1) ORDER BY s;
SELECT
  x_1.p.n AS n,
  x_1.p.v AS v
FROM
  UNNEST(TRANSFORM(ARRAY[CAST(ROW(CAST(ROW('x', 1) AS ROW(n varchar, v double))) AS ROW(p ROW(n varchar, v double))), CAST(ROW(CAST(ROW('y', 2) AS ROW(n varchar, v double))) AS ROW(p ROW(n varchar, v double)))], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY n;
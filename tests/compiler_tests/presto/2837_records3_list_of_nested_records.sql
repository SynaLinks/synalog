SELECT
  x_1.a.n AS n,
  x_1.a.v AS v
FROM
  UNNEST(TRANSFORM(ARRAY[CAST(ROW(CAST(ROW('p', 1) AS ROW(n varchar, v double))) AS ROW(a ROW(n varchar, v double))), CAST(ROW(CAST(ROW('q', 2) AS ROW(n varchar, v double))) AS ROW(a ROW(n varchar, v double)))], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY n;
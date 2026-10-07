SELECT
  x_3 AS d
FROM
  UNNEST(TRANSFORM(ARRAY['2026-01-05', '2026-03-01'], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  (x_3 < '2026-02-01');
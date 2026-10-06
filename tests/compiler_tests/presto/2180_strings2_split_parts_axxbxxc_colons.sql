SELECT
  x_1 AS part
FROM
  UNNEST(TRANSFORM(SPLIT('a::b::c', '::'), synalog_e -> ROW(synalog_e))) as pushkin(x_1)
GROUP BY 1 ORDER BY part;
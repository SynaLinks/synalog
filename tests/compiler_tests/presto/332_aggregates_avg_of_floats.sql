SELECT
  AVG(x_2) AS a
FROM
  UNNEST(TRANSFORM(ARRAY[0.25E0, 0.75E0], synalog_e -> ROW(synalog_e))) as pushkin(x_2);